//
//  VoiceOperationViewModel.swift
//  VoiceOperationSample
//
//  Created by Takuya Aso on 2021/11/23.
//

import SwiftUI
import Speech

final class VoiceOperationViewModel: ObservableObject {

    @Published var isAuthorized = false
    @Published var isShowAlert = false
    @Published var isRecognized = false
    @Published var recognizedText = "認識結果"

    private var audioEngine: AVAudioEngine
    private var speechRecognizer: SFSpeechRecognizer
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest
    private var recognitionTask: SFSpeechRecognitionTask!

    init() {
        self.audioEngine = AVAudioEngine()
        self.speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ja-JP"))!
        self.recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
    }

    /// 音声認識の許可状態をチェック
    func checkStatus() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    self.isAuthorized = true
                    self.setupAudioSession()
                case .denied, .restricted, .notDetermined:
                    self.isAuthorized = false
                    self.isShowAlert = true
                @unknown default:
                    fatalError()
                }
            }
        }
    }

    private func setupAudioSession() {
        do {
            // オンデバイス音声認識対応しているか
            if speechRecognizer.supportsOnDeviceRecognition {
                recognitionRequest.requiresOnDeviceRecognition = true
            }
            // 中間結果の取得を行うか
            recognitionRequest.shouldReportPartialResults = true
            // オーディオセッションの準備
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print(error.localizedDescription)
        }
    }

    func toggleRecognitionStatus() {
        isRecognized.toggle()
        if isRecognized {
            recognizedText = "認識中..."
            startRecognition()
        } else {
            stopRecognition()
        }
    }

    private func startRecognition() {
        do {
            // 音声認識タスクの停止
            if recognitionTask != nil {
                recognitionTask.cancel()
                recognitionTask.finish()
                recognitionTask = nil
            }
            // 入力ノードの生成
            let inputNode = self.audioEngine.inputNode
            let recordingFormat = inputNode.outputFormat(forBus: 0)
            inputNode.installTap(onBus: 0, bufferSize: 2048, format: recordingFormat) {(buffer, time) in
                self.recognitionRequest.append(buffer)
            }
            // 音声認識の開始
            audioEngine.prepare()
            try audioEngine.start()
            recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest, resultHandler: {(result, error) in
                if let error = error {
                    print("\(error)")
                } else {
                    if let result = result {
                        DispatchQueue.main.async {
                            self.recognizedText = result.bestTranscription.formattedString
                        }
                    }
                }
            })
        } catch {
            print(error.localizedDescription)
        }
    }

    private func stopRecognition() {
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        recognitionRequest.endAudio()
    }
}

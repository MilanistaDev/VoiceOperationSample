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
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?

    init() {
        self.audioEngine = AVAudioEngine()
        self.speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ja-JP"))!
    }

    /// 音声認識の許可状態をチェック
    func checkStatus() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    self.isAuthorized = true
                case .denied, .restricted, .notDetermined:
                    self.isAuthorized = false
                    self.isShowAlert = true
                @unknown default:
                    fatalError()
                }
            }
        }
    }

    func toggleRecognitionStatus() {
        isRecognized.toggle()
        if isRecognized {

        } else {

        }
    }
}

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

    func checkStatus() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    self.isAuthorized = true
                case .denied, .restricted, .notDetermined:
                    self.isAuthorized = false
                @unknown default:
                    fatalError()
                }
            }
        }
    }
}

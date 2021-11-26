//
//  VoiceOperationView.swift
//  VoiceOperationSample
//
//  Created by Takuya Aso on 2021/11/22.
//

import SwiftUI

struct VoiceOperationView: View {

    @ObservedObject var viewModel = VoiceOperationViewModel()

    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(setColor())
                Rectangle()
                    .strokeBorder(Color.gray, lineWidth: 1)
            }
            .frame(height: 250.0)
            .padding(.top, 60.0)
            Text("ボタンを押して発話してください。")
                .font(.footnote)
                .bold()
                .padding()
            Text(viewModel.recognizedText)
                .font(.footnote)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity)
                .padding()
            Spacer()
            HStack {
                ForEach(VoiceCommandType.allCases, id: \.self) { type in
                    Text("#" + type.name)
                        .font(.caption)
                        .foregroundColor(type.color)
                        .padding(.horizontal, 10.0)
                        .padding(.vertical, 4.0)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(type.color, lineWidth: 1))
                }
            }
            Button {
                viewModel.toggleRecognitionStatus()
            } label: {
                Text(viewModel.isRecognized ? "認識終了": "認識開始")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.white)
                    .frame(height: 44.0)
                    .frame(maxWidth: .infinity)
                    .background(viewModel.isAuthorized ? (viewModel.isRecognized ? Color.red: Color.green): Color.gray)
                    .cornerRadius(8.0)
            }
            .disabled(!viewModel.isAuthorized)
            .padding(.bottom, 16.0)

        }
        .padding(.horizontal, 20.0)
        .navigationTitle("SFSpeechRecognizer")
        .onAppear {
            viewModel.checkStatus()
        }
        .alert(isPresented: $viewModel.isShowAlert) {
            Alert(title: Text("確認"),
                  message: Text("音声認識機能使用不可です。音声認識利用を許可してください。"),
                  dismissButton: .default(Text("OK")))
        }
    }

    private func setColor() -> Color {
        if viewModel.recognizedText.contains("赤にして") {
            return .red
        } else if viewModel.recognizedText.contains("青にして") {
            return .blue
        } else if viewModel.recognizedText.contains("緑にして") {
            return .green
        } else if viewModel.recognizedText.contains("黒にして") {
            return .black
        } else {
            return .white
        }
    }
}

struct VoiceOperationView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceOperationView()
    }
}

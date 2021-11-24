//
//  VoiceOperationView.swift
//  VoiceOperationSample
//
//  Created by Takuya Aso on 2021/11/22.
//

import SwiftUI

struct VoiceOperationView: View {

    @ObservedObject var viewModel = VoiceOperationViewModel()
    @State private var text = "結果"

    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.white)
                Rectangle()
                    .strokeBorder(Color.gray, lineWidth: 1)
            }
            .frame(height: 250.0)
            .padding(.top, 60.0)
            Text("ボタンを押して発話してください。")
                .font(.footnote)
                .bold()
                .padding()
            Text(text)
                .font(.footnote)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity)
                .padding()
            Spacer()
            Button {

            } label: {
                Text("認識ボタン")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.white)
                    .frame(height: 44.0)
                    .frame(maxWidth: .infinity)
                    .background(viewModel.isAuthorized ? Color.blue: Color.gray)
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
    }
}

struct VoiceOperationView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceOperationView()
    }
}

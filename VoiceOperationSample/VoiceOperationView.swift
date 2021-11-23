//
//  VoiceOperationView.swift
//  VoiceOperationSample
//
//  Created by Takuya Aso on 2021/11/22.
//

import SwiftUI

struct VoiceOperationView: View {

    @State private var text = "ボタンを押して発話してください。"

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
            Text(text)
                .font(.footnote)
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
                    .background(Color.blue)
                    .cornerRadius(8.0)
            }
            .padding(.bottom, 16.0)

        }
        .padding(.horizontal, 20.0)
        .navigationTitle("SFSpeechRecognizer")
    }
}

struct VoiceOperationView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceOperationView()
    }
}

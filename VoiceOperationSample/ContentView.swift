//
//  ContentView.swift
//  VoiceOperationSample
//
//  Created by Takuya Aso on 2021/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Button {
                } label: {
                    Text("SFSpeechRecognizer")
                        .padding()
                }
            }
            .navigationTitle("音声操作サンプル？")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

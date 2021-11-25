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
                NavigationLink(destination: VoiceOperationView()) {
                    Text("SFSpeechRecognizer")
                        .padding()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("音声操作サンプル？")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  VoiceCommandType.swift
//  VoiceOperationSample
//
//  Created by Takuya Aso on 2021/11/26.
//

import SwiftUI

enum VoiceCommandType: Int, CaseIterable {
    case red
    case blue
    case green
    case black

    var name: String {
        switch self {
        case .red:
            return "#赤にして"
        case .blue:
            return "#青にして"
        case .green:
            return "#緑にして"
        case .black:
            return "#黒にして"
        }
    }

    var color: Color {
        switch self {
        case .red:
            return .red
        case .blue:
            return .blue
        case .green:
            return .green
        case .black:
            return .black
        }
    }
}

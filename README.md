# VoiceOperationSample

This app is a sample app that recognizes specific voice commands such as  
"make it red", "make it blue", "make it green", and "make it black" and  
change the background color of the view in the frame.  
Voice commands are only Japanese in this sample. So partial rewriting is required when using in English.

このアプリは、「赤にして」「青にして」「緑にして」「黒にして」などの特定の音声コマンドを認識して枠内のビューの背景色を変えるサンプルアプリです。

![voice](https://user-images.githubusercontent.com/8732417/143551220-49e5733e-77f1-4631-8078-567b8232cc16.gif)

## 開発環境

* Xcode 13 以上
* iOS 14 以上
* SwiftUI

## 使い方

1. 音声認識利用の許可
2. 許可したら下部のボタンをタップして認識状態に
3. 特定の音声コマンドを発話
4. 背景色が変化し認識状態終了

### コマンドリスト

変更する場合は enum の `VoiceCommandType` をいじります。

* 赤にして
* 青にして
* 緑にして
* 黒にして

## 技術

このアプリでは `SFSpeechRecognizer` を利用しています。  
認識状態は 1分間の制限があり回数制限もあります。  
認識状態が終了するとボタンが緑に戻り再度タップすることで認識状態になります。  

[SFSpeechRecognizer](https://developer.apple.com/documentation/speech/sfspeechrecognizer)

## 連続認識

コメントアウトしていますが，認識状態終了後にすぐ認識状態にできます。  
バッテリの減りやパフォーマンスに影響が出る可能性もあります。  

変更点は，ボタンタップのトリガーではなく，画面遷移後にすぐ認識状態になります。  
音声コマンド発話後一旦終了扱いにはなりますが認識状態に戻ります。  
連続して発話することで都度背景色の変更が可能という感じです。  

![voice2](https://user-images.githubusercontent.com/8732417/143551227-486a67d1-6e60-4ee3-9dc6-f3f6bce60d43.gif)

## Contact

Please feel free to contact us if you find a bug or have any feedback.  
Suggestions for adding functions and code corrections are also welcome.

```swift
let name = "Takuya Aso" 
let email = "milanista224" + "@" + "icloud.com"
let profession = "iOS Engineer"
let location = "Tokyo"
```

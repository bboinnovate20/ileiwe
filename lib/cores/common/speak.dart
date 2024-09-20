


 import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';

Future<void> tts(String word) async {
  FlutterTts flutterTts = FlutterTts();

  await flutterTts.setSharedInstance(true);
await flutterTts.setIosAudioCategory(IosTextToSpeechAudioCategory.playback,
    [
      IosTextToSpeechAudioCategoryOptions.allowBluetooth,
      IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
      IosTextToSpeechAudioCategoryOptions.mixWithOthers,
      IosTextToSpeechAudioCategoryOptions.defaultToSpeaker
    ],
    IosTextToSpeechAudioMode.defaultMode
);

print("speaking");
List<dynamic> languages = await flutterTts.getLanguages;
print(languages);
await flutterTts.setVolume(1.0);
await flutterTts.setLanguage("en-US");
// Future _speak() async{
 await flutterTts.speak(word);
    // if (result == 1) setState(() => ttsState = TtsState.playing);
// }

}

playMusic(String path) async{
    final player = AudioPlayer();
    await player.play(AssetSource(path));
}
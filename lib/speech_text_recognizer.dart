import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechTextRecognizer {
  static SpeechToText speechToText = SpeechToText();
  static initialize() async {
    bool status = await speechToText.initialize();
    print(status);
    return status;
  }

  static startListning(Function(SpeechRecognitionResult) recogFn) async {
    try {
      await speechToText.listen(
          listenMode: ListenMode.dictation,
          onResult: recogFn,
          listenFor: const Duration(seconds: 90));
    } catch (e) {
      print(e);
    }
  }

  static void stopListning() async {
    await speechToText.stop();
  }

  static bool isListning() {
    return speechToText.isListening;
  }
}

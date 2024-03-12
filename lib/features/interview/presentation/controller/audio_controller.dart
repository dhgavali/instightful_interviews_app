
import 'package:get/get.dart';
import 'package:record/record.dart';

class AudioController extends GetxController {
  RxBool isRecording = false.obs;
  final record = AudioRecorder();
  void startRecording() async {
    try {
      // await Microphone.start();
      isRecording.value = true;
      if (await record.hasPermission()) {
  // Start recording to file
  await record.start(const RecordConfig(), path: './myFile.m4a');
  // ... or to stream
  // final stream = await record.startStream(const RecordConfig(AudioEncoder.pcm16bits));
}

    } catch (e) {
      print('Failed to start recording: $e');
    }
  }

  void stopRecording() async {
    try {
      // await Microphone.stop();
      isRecording.value = false;
      record.stop();
      
      record.dispose();
    } catch (e) {
      print('Failed to stop recording: $e');
    }
  }
}

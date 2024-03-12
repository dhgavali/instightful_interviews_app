// import 'dart:io';

// import 'package:get/get.dart';
// import 'package:record/record.dart';
// import 'package:path_provider/path_provider.dart';

// class AudioController extends GetxController {
//   RxBool isRecording = false.obs;
//   final record = AudioRecorder();
//   String? audioPath;

//   Future<void> startRecording() async {
//     try {
//       Directory? appDocDir = await getTemporaryDirectory();
//       // final directory = await getDownloadsDirectory();

//       String appDocPath = appDocDir!.path;
//       print("App Document Directory path: $appDocPath");

//       isRecording.value = true;

//       if (await record.hasPermission()) {
//         print("Recording started");
//         // await record.start(RecordConfig(), path: appDocPath);
//          await record.start(path:);
//       }
//     } catch (e) {
//       print('Failed to start recording: $e');
//     }
//   }

//   Future<void> stopRecording() async {
//     try {
//       isRecording.value = false;
//       await record.stop();
//     } catch (e) {
//       print('Failed to stop recording: $e');
//     }
//   }

//   @override
//   void onClose() {
//     record.dispose(); // Dispose when controller is closed
//     super.onClose();
//   }
// }


import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart'; // Use the record package

class AudioRecorderController extends GetxController {
  final recorder = AudioRecorder();
  final audioFile = Rxn<File>(); // Reactive variable for audio file
  final isRecording = RxBool(false); // Reactive variable for recording state

  Future<void> requestPermissions() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      Get.snackbar(
        "Permission Required",
        "Microphone permission is needed to record audio.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> startRecording() async {
    if (await Permission.microphone.isGranted) {
             Directory? appDocDir = await getDownloadsDirectory();
      // final directory = await getDownloadsDirectory();

      String appDocPath = appDocDir!.path;
      print("appdocpath $appDocPath");
      var stream = await recorder.start(RecordConfig(), path: "$appDocPath/file.aac");
      // print(stream);
      isRecording.value = true;
    } else {
      await requestPermissions();
    }
  }

  Future<void> stopRecording() async {
    final recording = await recorder.stop();
    if (recording != null) {
      // audioFile.value = File(recording);
      isRecording.value = false;
    }
  }

  Future<void> saveRecording(String filename) async {
    if (audioFile.value == null) {
      Get.snackbar("No Recording", "Please record audio before saving.",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    final appDirectory = await getApplicationDocumentsDirectory();
    final savedFile = await audioFile.value!.copy('$appDirectory/$filename.aac');
    Get.snackbar("Saved", "Recording saved to ${savedFile.path}",
        snackPosition: SnackPosition.BOTTOM);
  }
}

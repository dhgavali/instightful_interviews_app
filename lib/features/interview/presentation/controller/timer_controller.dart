import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:instightful_interviews_app/features/interview/presentation/controller/AudioHandler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http_multi_server/http_multi_server.dart' as http_multi_server; // for MultipartRequest



class TimerController extends GetxController {
//  final AudioController audioController = Get.put(AudioController());
    // final AudioRecorderController audioController = Get.put(AudioRecorderController());
  final defaultTimer = 2;
  int _currentQuestionIndex = 0;
  int _timerValue = 2;
  late Timer _timer;
   final recordings = <File>[];

  int get currentQuestionIndex => _currentQuestionIndex;
  int get timerValue => _timerValue;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onClose() {
    _timer.cancel();
    // audioController.onClose();
    super.onClose();
  }

 void stopTimer(){
  print("timer stopped");
  
  // audioController.stopRecording();
  _timer.cancel();
  onClose();

 }
 AudioHandler ad = AudioHandler();
  void startTimer() async{
    // audioController.startRecording();
// start recording 
 var dir = await getDownloadsDirectory();
      String path = '${dir!.path}/$_currentQuestionIndex.aac';
ad.startRecording(path);


    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerValue == 0 && _currentQuestionIndex < 5) {
        showNextQuestion();
      
      } else {
        _timerValue--;
        update();
      }
    });

  }

  void showNextQuestion() async {
     var dir = await getDownloadsDirectory();
      String path = '${dir!.path}/$_currentQuestionIndex.aac';
     String? respose = await ad.stopRecording(path);
  recordings.add(File(respose!));

  print("the response $respose");
    _timer.cancel();
    _currentQuestionIndex = (_currentQuestionIndex + 1) ;
    _timerValue = defaultTimer;
    update();
    startTimer();
    
  }
} 

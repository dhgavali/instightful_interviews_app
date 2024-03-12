import 'dart:async';

import 'package:get/get.dart';
import 'package:instightful_interviews_app/features/interview/presentation/controller/audio_controller.dart';

class TimerController extends GetxController {
 final AudioController audioController = Get.put(AudioController());
  
  final defaultTimer = 2;
  int _currentQuestionIndex = 0;
  int _timerValue = 2;
  late Timer _timer;

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
    super.onClose();
  }

 void stopTimer(){
  audioController.stopRecording();
  onClose();
 }
  void startTimer() {
    audioController.startRecording();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerValue == 0) {
        showNextQuestion();
      } else {
        _timerValue--;
        update();
      }
    });
  }

  void showNextQuestion() {
    _timer.cancel();
    _currentQuestionIndex = (_currentQuestionIndex + 1) ;
    _timerValue = defaultTimer;
    update();
    startTimer();
    
  }
} 

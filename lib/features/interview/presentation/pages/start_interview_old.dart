import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instightful_interviews_app/core/components/buttons.dart';
import 'package:instightful_interviews_app/core/components/text_styles.dart';
import 'package:instightful_interviews_app/features/interview/presentation/controller/timer_controller.dart';
import 'package:instightful_interviews_app/routes/route_names.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

class StartInterview extends StatefulWidget {
  const StartInterview({super.key});

  @override
  State<StartInterview> createState() => _StartInterviewState();
}

class _StartInterviewState extends State<StartInterview> {
  final List<Map<String, dynamic>> _questions = [
    {
      "question": "What are the new features introduced in HTML5?",
      "ans":
          "HTML5 introduced several new features including semantic elements such as <header>, <footer>, <article>, <section>, and <nav>. It also introduced the <canvas> element for drawing graphics, native support for audio and video playback, local storage using localStorage, and improved form elements.",
      "points": 3,
      "topic": "HTML5"
    },
    {
      "question": "Explain the box model in CSS.",
      "ans":
          "The box model in CSS describes the design and layout of elements on a web page. It consists of content, padding, border, and margin. The content area contains the actual content of the element, padding provides space between the content and the border, border outlines the content and padding, and margin clears an area around the border.",
      "points": 4,
      "topic": "CSS"
    },
    {
      "question": "What is responsive web design?",
      "ans":
          "Responsive web design is an approach to web design that ensures a web page's layout adjusts dynamically to fit different screen sizes and orientations. It uses fluid grids, flexible images, and media queries to achieve this. Responsive design helps ensure a consistent user experience across various devices such as desktops, tablets, and smartphones.",
      "points": 3,
      "topic": "Responsive Web Design"
    },
    {
      "question": "What are the advantages of using CSS preprocessors?",
      "ans":
          "CSS preprocessors like Sass and LESS offer several advantages such as variables for easy reuse of values, nesting for cleaner code structure, mixins for reusable style patterns, and functions for more dynamic styles. Preprocessors also allow for modularization and organization of CSS code, making it easier to maintain and scale.",
      "points": 4,
      "topic": "CSS Preprocessors"
    },
    {
      "question": "Explain the concept of event bubbling in JavaScript.",
      "ans":
          "Event bubbling is a mechanism in JavaScript where events triggered on the innermost element are propagated up through the DOM hierarchy to the outermost element, triggering handlers on each ancestor element in the chain. This allows for handling events in a more organized and controlled manner, as events can be captured at different levels of the DOM hierarchy.",
      "points": 3,
      "topic": "JavaScript"
    }
  ];

  final recorder = Record();
  File? recording_file; // List to s
  final isRecording = ValueNotifier<bool>(false);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> startRecording(String index) async {
    try {
      var dir = await getDownloadsDirectory();
      String path = dir!.path + index + ".aac";
      print("path $path");

      await recorder.start();
    } catch (err) {
      print('error $err');
    }
  }

  Future<void> stopRecording(index) async {
    try {
      // var dir = await getDownloadsDirectory();

      // String path = dir!.path + index + ".aac";
      // print("path $path");

      String? recording = await recorder.stop();
      print("recording $recording");
      if (recording != null) {
        // recordings.add(File(recording));
        recording_file = File(recording);
        print(recording_file);
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
      child: GetBuilder<TimerController>(
        init: TimerController(),
        builder: (controller) {
          if (controller.currentQuestionIndex >= 1) {
            return Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/icons/verified.png",
                    width: width * 0.5,
                  ),
                  MyTexts.h2("Interview Completed!"),
                  PrimaryBtn(
                      label: "Click to go Home",
                      onpress: () {
                        // Get.toNamed(RoutesNames.homeScreen);
                        print(recording_file);
                      })
                ],
              ),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  _questions[controller.currentQuestionIndex]['question'],
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Timer: ${controller.timerValue}',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (controller.currentQuestionIndex <
                        _questions.length - 1) {
                      controller.showNextQuestion();
                    } else {
                      controller.stopTimer();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("ends")));
                    }
                  },
                  child: Text('Next'),
                ),
              ],
            );
          }
        },
      ),
    ));
  }
}

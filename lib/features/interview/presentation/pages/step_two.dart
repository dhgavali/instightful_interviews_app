import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instightful_interviews_app/core/components/exports.dart';
import 'package:instightful_interviews_app/features/interview/data/repository/interview_repository_impl.dart';
import 'package:instightful_interviews_app/features/interview/presentation/bloc/interview_bloc.dart';
import 'package:instightful_interviews_app/features/interview/presentation/controller/terms_controller.dart';
import 'package:instightful_interviews_app/routes/route_names.dart';
import 'package:permission_handler/permission_handler.dart';

final InterviewBloc interviewBloc = InterviewBloc();
class StepTwo extends StatefulWidget {
  StepTwo({super.key});

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  CameraController? _cameraController;
  final TermsController controller = Get.put(TermsController());

  bool _isChecked = false;

  Future _initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);

    _cameraController = CameraController(
      frontCamera, // Use the front camera
      ResolutionPreset.medium,
    );

    await _cameraController!.initialize();
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      await _initializeCamera();
    } else {
      // Handle permissions not granted
      // Get.snackbar(
      //   'Permission Required',
      //   'Please grant camera permission to continue',
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }
  }

  @override
  void dispose() {
    _cameraController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: MyTexts.h3(
          "Intellivue",
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(Icons.notifications_active),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<void>(
              future: _requestCameraPermission(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (_cameraController != null) {
                    return SizedBox(
                      height: width * 0.8,
                      child: CameraPreview(
                        _cameraController!,
                        child: Center(
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: width * 0.6,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green)),
                            ),
                          ],
                        )),
                      ),
                    );
                    //  return Container();
                  }
                  return Container();
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Instructions:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text('- Look into the camera'),
          const Text('- Make sure you are in a silent place'),
          const Text(
              '- Do not leave in between to complete evaluation process'),
          const Text('- Cheating is not allowed'),
          const SizedBox(height: 20),
          Obx(
            () => Row(
              children: [
                Checkbox(
                  value: controller.isChecked.value,
                  onChanged: (value) {
                    controller.updateChecked(value);
                  },
                ),
                Text('I agree to the terms'),
              ],
            ),
          ),
          SizedBox(
            height: width * 0.1,
          ),
          PrimaryBtn(
            label: "Start Interview",
            onpress: () {
              interviewBloc.add(BeginInterviewEvent(
                  yoe: "2",
                  role: "Frontend Developer",
                  jd: "This job involves creating websites for company in React JS."));
              Get.toNamed(RoutesNames.startInterview);
              print("hello");
            },
            bgColor:
                controller.isChecked.value ? Colors.red : AppColors.KdarkGray,
          ),
          SizedBox(
            height: width * 0.05,
          ),
        ],
      ),
    );
  }
}

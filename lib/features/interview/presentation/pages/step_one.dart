import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:instightful_interviews_app/core/components/exports.dart';
import 'package:instightful_interviews_app/features/auth/presentation/widgets/auth_backgound.dart';
import 'package:instightful_interviews_app/features/auth/presentation/widgets/auth_textfields.dart';
import 'package:instightful_interviews_app/features/interview/presentation/controller/type_ahead_controller.dart';
import 'package:instightful_interviews_app/features/interview/presentation/pages/step_two.dart';
import 'package:instightful_interviews_app/routes/route_names.dart';

import '../../../auth/presentation/widgets/buttons.dart';

class StepOne extends StatefulWidget {
  const StepOne({super.key});

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  final TypeAheadController controller = Get.put(TypeAheadController());

  List<String> roleList = [
    "Front End Developer",
    "Backend Developer",
    "Cloud Developer"
  ];

  String selectedRole = "Front End Developer";

  @override
  Widget build(BuildContext context) {
    TextEditingController yoeController = TextEditingController();
    TextEditingController jdController = TextEditingController();

    return AuthBackgroundScaffold(
        child: SafeArea(
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            Row(
              children: [
                CustomBackButton(onTap: () {
                  Get.toNamed(RoutesNames.landingPage);
                }),
              ],
            ),
            Text(
              "Select Details",
              style: TextStyle(color: Colors.white, fontSize: 28.sp),
            ),
            SizedBox(height: 60.h),
            CustomDropdown(
                items: roleList,
                value: selectedRole,
                onChanged: (value) {
                  setState(() {
                    selectedRole = value!;
                  });
                }),
            SizedBox(height: 60.h),
            AuthTextField(
              isPassword: false,
              hint: "Years of Experience",
              controller: yoeController,
            ),
            SizedBox(height: 60.h),
            AuthTextField(
              isPassword: false,
              hint: "Job Description",
              controller: jdController,
            ),
            SizedBox(height: 60.h),
            LoginButton("Next", onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StepTwo(
                    jd: jdController.text,
                    yoe: yoeController.text,
                    role: selectedRole,
                  ),
                ),
              );
            })
          ],
        ),
      )),
    ));
  }
}

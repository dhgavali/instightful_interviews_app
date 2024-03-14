import 'package:flutter/material.dart';
import 'package:instightful_interviews_app/core/components/exports.dart';
import 'package:get/get.dart';

import 'package:instightful_interviews_app/routes/route_names.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  bool isProfileComplete = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: appLogo(),
        ),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(Icons.notifications_active),
          )
        ],
      ),
      body: Container(
        width: width,
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: MyTexts.h3("Hello Yash!",)),
          SizedBox(height: 10,),
          Container(
            width: width * 0.6,
            child:
                MyTexts.h3("Get Ready to experience the Free Mock Interview !"),
          ),
          SizedBox(
            height: width * 0.1,
          ),
          Image.asset(
            "assets/icons/schedule.png",
            width: width * 0.6,
          ),
          SizedBox(
            height: width * 0.2,
          ),
          PrimaryBtn(
              label: "Get Started",
              onpress: () {
                Get.toNamed(RoutesNames.stepOne);
              }),
        ],
      )),
    );
  }
}

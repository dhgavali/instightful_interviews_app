import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../routes/route_names.dart';

class LoginButton extends StatelessWidget {
  String text = "Login";
  Color color;
  void Function() onPressed;
  LoginButton(
    this.text, {
    this.color = Colors.white,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Container(
        height: 50.h,
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18.sp,
                color: color == Colors.white ? Colors.black : Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

class SignupButton extends StatelessWidget {
  void Function() onPressed;
  SignupButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.transparent,
      height: 55.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.transparent,
          border: Border.all(color: Colors.white, width: 3.h)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // foregroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Center(
          child: Text(
            'Sign Up',
            style: TextStyle(
                fontSize: 18.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

class SocialLoginButtons extends StatelessWidget {
  SocialLoginButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SocialLoginButton(),
        SizedBox(width: 10.w),
        SocialLoginButton(),
      ],
    );
  }

  ElevatedButton SocialLoginButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle login button press
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Container(
        height: 50.h,
        width: 118.w,
        decoration: const BoxDecoration(),
        child: const Icon(Icons.facebook),
      ),
    );
  }
}

class ChangeAuthTextButton extends StatelessWidget {
  final bool isLogin;
  const ChangeAuthTextButton({
    super.key,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
          isLogin ? RoutesNames.signupScreen : RoutesNames.loginScreen),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(
                text: isLogin
                    ? "Don't have an account? "
                    : "Already have an account? "),
            TextSpan(
              text: isLogin ? 'Sign Up Now' : "Login Now",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
          // color: const Color(0xffE4E5FE),
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: const Color(0xffE9E9E9)),
          // boxShadow: const [
          //   BoxShadow(
          //       offset: Offset(0, 4), color: Colors.black26, blurRadius: 8)
          // ],
        ),
        child: Icon(Icons.arrow_back_ios_new, size: 30.h, color: Colors.white),
      ),
    );
  }
}

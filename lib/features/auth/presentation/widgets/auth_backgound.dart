import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/color_const.dart';

class AuthBackgroundScaffold extends StatelessWidget {
  final Widget child;
  AuthBackgroundScaffold({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w), child: child),
        decoration: BoxDecoration(gradient: ColorConstants.loginGradient),
      ),
    );
  }
}

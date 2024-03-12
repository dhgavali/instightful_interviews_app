import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:instightful_interviews_app/core/components/myColors.dart';

class Loadings {
  static Widget basic() {
    return const SpinKitPulsingGrid(
      color: AppColors.kSecondary,
      size: 50.0,
    );
  }
}

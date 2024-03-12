import 'package:flutter/material.dart';
import 'package:instightful_interviews_app/core/components/myColors.dart';
import 'package:instightful_interviews_app/core/components/text_styles.dart';

class PrimaryBtn extends StatelessWidget {
  final String label;
  final Function() onpress;
  final double hr, vr, width, height;
  final Color bgColor;
  final isDisabled;
  const PrimaryBtn({
    super.key,
    required this.label,
    required this.onpress,
    this.width = 285,
    this.height = 45,
    this.hr = 0,
    this.vr = 5,
    this.bgColor = AppColors.kPrimary,
    this.isDisabled = false
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? ()=>{} : onpress,
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: hr, vertical: vr),
          width: width,
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 2),
                color: AppColors.Kgray,
                blurRadius: 4,
              ),
              BoxShadow(
                offset: Offset(2, 2),
                color: AppColors.Kgray,
                blurRadius: 4,
              ),
            ],
          ),
          child:  MyTexts.body3(
           label,
              fontWeight: FontWeight.w700,
              color: AppColors.Kwhite,
           ),)
    );
  }
}

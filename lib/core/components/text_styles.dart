import 'package:flutter/material.dart';
import 'package:instightful_interviews_app/core/components/myColors.dart';

class MyTexts {
  static const String poppinsFont = "Poppins";

 static TextStyle customStyle({
    FontWeight fontWeight = FontWeight.w400,
    double fontsize = 10,
    Color fontcolor = AppColors.Kgray,
  }) {
    return TextStyle(
      fontFamily: poppinsFont,
      fontWeight: fontWeight,
      fontSize: fontsize,
      color: fontcolor,
    );
  }
  static Widget h1(String text,{ Color color = AppColors.KdarkGray}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: poppinsFont,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: color,
      ),
    );
  }

  static Widget h2(String text,{ Color color = AppColors.KdarkGray}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: poppinsFont,
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color:color,
      ),
    );
  }

  static Widget h3(String text,{ Color color = AppColors.KdarkGray}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: poppinsFont,
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: color,
      ),
    );
  }

  static Widget h4(String text, {Color color = AppColors.kPrimary}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: poppinsFont,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: color,
      ),
    );
  }

  static Widget h5(String text,{ Color color = AppColors.KdarkGray}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: poppinsFont,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color:color,
      ),
    );
  }
  static Widget h6(String text,{ Color color = AppColors.KdarkGray}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: poppinsFont,
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color:color,
      ),
    );
  }

  static Widget body1(String text, {Color color = AppColors.KdarkGray, FontWeight fontWeight = FontWeight.w400  , TextAlign textAlign = TextAlign.center}){
     return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: poppinsFont,
        fontWeight: fontWeight,
        fontSize: 16,
        color:color,
      ),
    );
  }
  static Widget body2(String text, {Color color = AppColors.KdarkGray, FontWeight fontWeight = FontWeight.w400  }){
     return Text(
      text,
      style: TextStyle(
        fontFamily: poppinsFont,
        fontWeight: fontWeight,
        fontSize: 14,
        color:color,
      ),
    );
  }
  static Widget body3(String text, {Color color = AppColors.KdarkGray, FontWeight fontWeight = FontWeight.w400  }){
     return Text(
      text,
      style: TextStyle(
        fontFamily: poppinsFont,
        fontWeight: fontWeight,
        fontSize: 12,
        color:color,
      ),
    );
  }
  static Widget body4(String text, {Color color = AppColors.KdarkGray, FontWeight fontWeight = FontWeight.w400  }){
     return Text(
      text,
      style: TextStyle(
        fontFamily: poppinsFont,
        fontWeight: fontWeight,
        fontSize: 10,
        color:color,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instightful_interviews_app/core/components/myColors.dart';
import 'package:instightful_interviews_app/core/components/text_styles.dart';

class MyTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final double width;
  final double height;
  final TextInputType keytype;
  final int maxlen;
  final double hr;
  final double vr;
  final bool readOnly;
  final bool ispassword;
  final bool digitsonly;
  final String initialValue;
  final String? Function(String?)? validate;

  MyTextField({
    super.key,
    required this.label,
    required this.controller,
    this.width = 285,
    this.height = 50,
    this.keytype = TextInputType.name,
    this.maxlen = 200,
    this.hr = 15,
    this.vr = 10,
    this.readOnly = false,
    this.ispassword = false,
    this.digitsonly = false,
    this.initialValue = "",
    this.validate,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  void initState() {
    if (widget.initialValue != "") {
      widget.controller.text = widget.initialValue;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: widget.width,
      height: widget.height,
      
      decoration: BoxDecoration(
        color: AppColors.KdarkGray.withOpacity(0.95),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            color: AppColors.KdarkGray,
            blurRadius: 4,
          ),
        ],
      ),
      margin:
          EdgeInsets.symmetric(horizontal: widget.hr, vertical: widget.vr),
      child: TextFormField(
        validator: widget.validate,
        controller: widget.controller,
        cursorColor: AppColors.kPrimary,
        style: MyTexts.customStyle(
          fontsize: 14,
          fontWeight: FontWeight.w500,
          fontcolor: widget.readOnly ? AppColors.KdarkGray : AppColors.kPrimary,
        ),
        obscureText: widget.ispassword,
        readOnly: widget.readOnly,
        onFieldSubmitted: (value) {
          widget.controller.text = value;
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          border: InputBorder.none,
          hintText: widget.label,
          hintStyle: MyTexts.customStyle(
            fontsize: 14,
            fontWeight: FontWeight.w500,
          ),
          counterText: "",
          counter: null,
        ),
        inputFormatters:
            widget.digitsonly ? [FilteringTextInputFormatter.digitsOnly] : [],
        keyboardType: widget.digitsonly ? TextInputType.number : widget.keytype,
        maxLength: widget.maxlen,
      ),
    );
  }
}

Widget myInpField(
    {required String label,
    required TextEditingController controller,
    double width = 285,
    double height = 50,
    TextInputType keytype = TextInputType.name,
    int maxlen = 200,
    double hr = 15,
    double vr = 10,
    bool readOnly = false,
    bool ispassword = false,
    bool digitsonly = false,
    String initialValue = "",

    String? Function(String?)? validate}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5),
    width: width,
    height: height, 
    decoration: BoxDecoration(
      color: AppColors.Kwhite.withOpacity(0.95),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: AppColors.Kgray)
    ),
    margin: EdgeInsets.symmetric(horizontal: hr, vertical: vr),
    child: TextFormField(
      validator: validate,
      controller: controller,
      style: MyTexts.customStyle(
        fontsize: 14,
        fontWeight: FontWeight.w500,
        fontcolor: readOnly ? AppColors.KdarkGray : Colors.black,
      ),
      obscureText: ispassword,
      readOnly: readOnly,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
        border: InputBorder.none,
        hintText: label,
        hintStyle: MyTexts.customStyle(
          fontsize: 14,
          fontWeight: FontWeight.w500,
        ),
        counterText: "",
        counter: null,
      ),
      inputFormatters:
          digitsonly ? [FilteringTextInputFormatter.digitsOnly] : [],
      keyboardType: digitsonly ? TextInputType.number : keytype,
      maxLength: maxlen,
    ),
  );
}

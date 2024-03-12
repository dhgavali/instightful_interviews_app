 import 'package:flutter/material.dart';

Future<DateTime?> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2040),
    );
    if (picked != null) {
      return picked;
    } else {
      return null;
    }
  }
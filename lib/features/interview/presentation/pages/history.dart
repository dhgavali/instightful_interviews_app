import 'package:flutter/material.dart';
import 'package:instightful_interviews_app/core/components/exports.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar( title: MyTexts.h3("Intellivue",
     ),
   actions: const [Padding(
       padding:  EdgeInsets.symmetric(horizontal: 20.0),
       child: Icon(Icons.notifications_active),
     )],),
     body: Center(child: MyTexts.h3("No Past History")),
    );
  }
}
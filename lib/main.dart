import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instightful_interviews_app/routes/route_names.dart';
import 'package:instightful_interviews_app/routes/router.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});  
  @override
  Widget build(BuildContext context) {
     return GetMaterialApp(
          defaultTransition: Transition.leftToRight,
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesNames.stepOne,
          getPages: AppRoutes.routes,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: "Poppins",
            appBarTheme:const AppBarTheme(backgroundColor: Colors.transparent),
          ),
        );
  }
}

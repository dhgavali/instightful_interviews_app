import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      child: GetMaterialApp(
        defaultTransition: Transition.leftToRight,
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesNames.result,
        getPages: AppRoutes.routes,
        theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Poppins",
          appBarTheme:
              const AppBarTheme(backgroundColor: Colors.white, elevation: 0),
        ),
      ),
    );
  }
}

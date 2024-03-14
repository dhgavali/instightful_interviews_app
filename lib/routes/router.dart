// Add routes used in application
import 'package:get/get.dart';
import 'package:instightful_interviews_app/features/auth/presentation/pages/auth.dart';
import 'package:instightful_interviews_app/features/auth/presentation/pages/login.dart';
import 'package:instightful_interviews_app/features/auth/presentation/pages/login_page.dart';
import 'package:instightful_interviews_app/features/auth/presentation/pages/onboarding.dart';
import 'package:instightful_interviews_app/features/auth/presentation/pages/signup_page.dart';
import 'package:instightful_interviews_app/features/interview/presentation/pages/history.dart';
import 'package:instightful_interviews_app/features/interview/presentation/pages/home_page.dart';
import 'package:instightful_interviews_app/features/interview/presentation/pages/landing.dart';
import 'package:instightful_interviews_app/features/interview/presentation/pages/notfication_page.dart';
import 'package:instightful_interviews_app/features/interview/presentation/pages/profile_page.dart';
import 'package:instightful_interviews_app/features/interview/presentation/pages/start_interview.dart';
import 'package:instightful_interviews_app/features/interview/presentation/pages/step_one.dart';
import 'package:instightful_interviews_app/features/interview/presentation/pages/step_two.dart';
import './route_names.dart';

class AppRoutes {
  // Auth Pages Routing
  static final routes = [
    GetPage(name: RoutesNames.onboard, page: () => const OnBoardingPage()),
    GetPage(name: RoutesNames.authPage, page: () => const AuthHandlerPage()),
    GetPage(name: RoutesNames.loginScreen, page: () => LoginPage()),
    GetPage(name: RoutesNames.signupScreen, page: () => SignUpPage()),

    // Home Screen Pages
    GetPage(name: RoutesNames.landingPage, page: () => LandingPage()),
    GetPage(name: RoutesNames.homeScreen, page: () => HomePage()),
    GetPage(name: RoutesNames.stepOne, page: () => StepOne()),
    GetPage(name: RoutesNames.stepTwo, page: () => StepTwo()),
    GetPage(name: RoutesNames.startInterview, page: () => StartInterview()),

    // menu pages
    GetPage(name: RoutesNames.landingPage, page: () => LandingPage()),
    GetPage(name: RoutesNames.profile, page: () => ProfilePage()),
    GetPage(name: RoutesNames.history, page: () => HistoryPage()),
    GetPage(name: RoutesNames.notification, page: () => NotificationPage()),
  ];
}

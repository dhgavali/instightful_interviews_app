
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instightful_interviews_app/core/components/exports.dart';
import 'package:instightful_interviews_app/features/interview/presentation/pages/history.dart';
import 'package:instightful_interviews_app/features/interview/presentation/widgets/LandingController.dart';
import 'package:instightful_interviews_app/features/interview/presentation/pages/home_page.dart';
import 'package:instightful_interviews_app/features/interview/presentation/pages/profile_page.dart';
import 'package:instightful_interviews_app/features/interview/presentation/pages/step_one.dart';

class LandingPage extends StatelessWidget {
   LandingPage({super.key});


  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

 

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: landingPageController.changeTabIndex,
          currentIndex: landingPageController.tabIndex.value,
          backgroundColor: AppColors.Kwhite,
          unselectedItemColor: AppColors.Kgray,
          selectedItemColor: AppColors.KdarkGray,
          unselectedLabelStyle: unselectedLabelStyle,
          selectedLabelStyle: selectedLabelStyle,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: const Icon(
                  Icons.home,
                  size: 20.0,
                ),
              ),
              label: 'Home',
              backgroundColor: AppColors.Kwhite,
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: const Icon(
                  Icons.explore_outlined,
                  size: 20.0,
                ),
              ),
              label: 'Interview',
              // backgroundColor: AppColors.btmNavColor,
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: const Icon(
                  Icons.notifications_active,
                  size: 20.0,
                ),
              ),
              label: 'History',
              // backgroundColor: AppColors.btmNavColor,
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: const Icon(Icons.person),
              ),
              label: "Profile",
              backgroundColor: AppColors.Kwhite,
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
        Get.put(LandingPageController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children:  [
             HomePage(),
             StepOne(),
             HistoryPage(),
             ProfilePage(),
            ],
          )),
    ));
  }
}
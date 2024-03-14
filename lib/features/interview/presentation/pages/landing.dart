
import 'package:flutter/material.dart';
import 'package:instightful_interviews_app/core/components/exports.dart';
import 'package:instightful_interviews_app/features/interview/presentation/pages/history.dart';
import 'package:instightful_interviews_app/features/interview/presentation/pages/home_page.dart';
import 'package:instightful_interviews_app/features/interview/presentation/pages/settings/profile_page.dart';
import 'package:instightful_interviews_app/features/interview/presentation/pages/step_one.dart';

// class LandingPage extends StatelessWidget {
//    LandingPage({super.key});


//   final TextStyle unselectedLabelStyle = TextStyle(
//       color: Colors.white.withOpacity(0.5),
//       fontWeight: FontWeight.w500,
//       fontSize: 12);

//   final TextStyle selectedLabelStyle = const TextStyle(
//       color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

 

//   buildBottomNavigationMenu(context, landingPageController) {
//     return Obx(() => BottomNavigationBar(
//           showUnselectedLabels: true,
//           showSelectedLabels: true,
//           onTap: landingPageController.changeTabIndex,
//           currentIndex: landingPageController.tabIndex.value,
//           backgroundColor: AppColors.Kwhite,
//           unselectedItemColor: AppColors.Kgray,
//           selectedItemColor: AppColors.KdarkGray,
//           unselectedLabelStyle: unselectedLabelStyle,
//           selectedLabelStyle: selectedLabelStyle,
//           items: [
//             BottomNavigationBarItem(
//               icon: Container(
//                 margin: const EdgeInsets.only(bottom: 7),
//                 child: const Icon(
//                   Icons.home,
//                   size: 20.0,
//                 ),
//               ),
//               label: 'Home',
//               backgroundColor: AppColors.Kwhite,
//             ),
//             BottomNavigationBarItem(
//               icon: Container(
//                 margin: const EdgeInsets.only(bottom: 7),
//                 child: const Icon(
//                   Icons.explore_outlined,
//                   size: 20.0,
//                 ),
//               ),
//               label: 'Interview',
//               // backgroundColor: AppColors.btmNavColor,
//             ),
//             BottomNavigationBarItem(
//               icon: Container(
//                 margin: const EdgeInsets.only(bottom: 7),
//                 child: const Icon(
//                   Icons.notifications_active,
//                   size: 20.0,
//                 ),
//               ),
//               label: 'History',
//               // backgroundColor: AppColors.btmNavColor,
//             ),
//             BottomNavigationBarItem(
//               icon: Container(
//                 margin: const EdgeInsets.only(bottom: 7),
//                 child: const Icon(Icons.person),
//               ),
//               label: "Profile",
//               backgroundColor: AppColors.Kwhite,
//             ),
//           ],
//         ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     final LandingPageController landingPageController =
//         Get.put(LandingPageController(), permanent: false);
//     return SafeArea(
//         child: Scaffold(
//       bottomNavigationBar:
//           buildBottomNavigationMenu(context, landingPageController),
//       body: Obx(() => IndexedStack(
//             index: landingPageController.tabIndex.value,
//             children:  [
//              LandingPage(),
//              StepOne(),
//              HistoryPage(),
//              ProfilePage(),
//             ],
//           )),
//     ));
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  PersistentTabController _controller = PersistentTabController(initialIndex: 0);
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: Icon(Icons.home_outlined),
                title: ("Home"), 
                contentPadding: 0,

                activeColorPrimary: AppColors.kdark,
                inactiveColorPrimary: CupertinoColors.systemGrey,
              
            ),
            PersistentBottomNavBarItem(
                                             icon: Icon(Icons.explore),

                contentPadding: 0,
                title: ("Activation"),
               activeColorPrimary: AppColors.kdark,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            
            ),
            PersistentBottomNavBarItem(
                               icon: Icon(Icons.history),
                title: ("Profile"),
               activeColorPrimary: AppColors.kdark,
                inactiveColorPrimary: CupertinoColors.systemGrey,
             
            ),
            PersistentBottomNavBarItem(
              //  icon: SizedBox(width: 20, height: 20, child: SvgPicture.asset("assets/icons/more.svg", width: 10,)),
                                                                      icon: Icon(Icons.person),

                title: "More",
            contentPadding: 5,
            

             activeColorPrimary: AppColors.kdark,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
        ];
    }
List<Widget> _buildScreens() {
        return [
         HomePage(),
             StepOne(),
             HistoryPage(),
             ProfilePage(),
        ];
    }

   
  @override
  Widget build(BuildContext context) {
    // UserModel userdata = userDataController.userData.value;
    // print(userdata.companyName);
return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties:const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation:const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style5// Choose the nav bar style with this property.
    );


  }
    
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instightful_interviews_app/core/components/datePicker.dart';
import 'package:instightful_interviews_app/core/components/exports.dart';
import 'package:instightful_interviews_app/core/secure_storage.dart';
import 'package:instightful_interviews_app/features/auth/data/repository/authRepositoryImpl.dart';
import 'package:instightful_interviews_app/features/auth/domain/entity/user_model.dart';
import 'package:instightful_interviews_app/features/interview/presentation/controller/date_controller.dart';
import 'package:instightful_interviews_app/features/interview/presentation/controller/gender_controller.dart';
import 'package:instightful_interviews_app/features/interview/presentation/pages/settings/edit_profile.dart';
import 'package:instightful_interviews_app/routes/route_names.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  Map<String, dynamic> data = {
    "username": "string",
    "email": "dhirajpawar@gmail.com",
    "first_name": "Dhiraj",
    "last_name": "Pawar",
    "role": "Student",
  };

//method to load api data for future builder
  Future<User?> loadData(BuildContext context) async {
    AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl();
    String? username = await StorageHelper.getUserToken();
    final dataOrError =
        await authRepositoryImpl.getUserDetails(username: username!);
    dataOrError.fold((l) {
      // MyWidgets.showSnackbar(msg: "Error!", context: context);
      return null;
    }, (r) async {
      // print("sucesss");
      MyWidgets.showSnackbar(msg: "Profile Data loaded", context: context);
      return r;
    });
  }

// dummy future function
  Future<bool> loadUser() async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyTexts.h3(
          "Profile",
        ),
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () {
              Get.offAllNamed(RoutesNames.onboard);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: loadUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return  Profile();
                }
              }
              return Loadings.basic();
            }),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            width: width,
            height: height * 0.4,
            
            decoration: BoxDecoration(color: AppColors.KlightGray,
            image: DecorationImage(
          image: AssetImage('assets/icons/profile_bg.jpg'),
          fit: BoxFit.cover,
        ),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Center(
                child: CircleAvatar(
                  backgroundColor: AppColors.Kgray,
                  radius: 50,
                  foregroundImage: AssetImage("assets/icons/user.png"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MyTexts.h3("Dhananjay Gavali", color: AppColors.Kwhite),
            ]),
          ),
          Positioned(
            width: width,
            height: height * 0.6,
            top: height * 0.4 - 100,
            child: Container(
              width: width,
            
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 30.h,),
               MenuRow(
                icon: Icons.settings,
                label: "Account",
                onpress: (){
                Navigator.pushNamed(context, RoutesNames.editProfile);
                },
              ),
      
              
                MenuRow(
                icon: Icons.history,
                label: "Past Interviews",
                 onpress: (){
                  print("heelo");
                },
              ),
      
      
                MenuRow(
                icon: Icons.share,
                label: "Latest Updates",
                 onpress: (){
                  print("heelo");
                },
              ),
                MenuRow(
                icon: Icons.info,
                label: "App Info",
                 onpress: (){
                  print("heelo");
                },
              ),
      
                MenuRow(
                icon: Icons.logout,
                label: "logout",
               onpress: (){
                  print("heelo");
                },
              ),

              ],)
            ),
          ),
        ],
      ),
    );
  }
}

class MenuRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onpress;
  const MenuRow({super.key, required this.icon, required this.label, required this.onpress});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
  print("build once");
    return GestureDetector(
      onTap: (){
        onpress();
      },
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
         decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: AppColors.KlightGray,
                    ),
         
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                   decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.kdark,
                    ),
                    child: Icon(icon, color: AppColors.Kwhite,),
                  ),
                  SizedBox(width: 15.w,),
                  MyTexts.h4(label, color: Colors.black),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.kdark,),
              )
            ],
          )),
    );
  }
}

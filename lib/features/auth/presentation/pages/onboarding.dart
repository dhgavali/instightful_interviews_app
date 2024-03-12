import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instightful_interviews_app/core/components/exports.dart';
import 'package:instightful_interviews_app/core/permission_handler.dart';
import 'package:instightful_interviews_app/routes/route_names.dart';
import 'package:instightful_interviews_app/features/auth/presentation/widgets/slider_widget.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});


  Future<bool> getAllPermissions()async{
    bool res = await PermissionManager.checkPermision();
    // bool storagePermission = await PermissionManager.checkStoragePermission();
    print("final res $res");
    if(res){
      return true;
    }
    else{
      try{
        print("here 1");
          await PermissionManager.requestPermissions();
      await PermissionManager.requestAudioPermission();
  await PermissionManager.requestStoragePermission();
      if(await PermissionManager.checkPermision()){
        return true;
      }
      else{
        return false;
      }
      }
      catch(err){
        print("err");
      } 
    }
    
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: getAllPermissions(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if(snapshot.hasData){
 return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        appLogo(width: 200),
                        SliderWidget(),
                        PrimaryBtn(
                            label: "Continue",
                            onpress: () {
                              Get.toNamed(RoutesNames.loginScreen);
                            })
                      ],
                    ));
                }
                return Container();
               
              } else {
                return Container();
              }
            }),
      ),
    );
  }
}

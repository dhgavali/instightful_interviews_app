import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instightful_interviews_app/core/components/exports.dart';
import 'package:instightful_interviews_app/core/secure_storage.dart';
import 'package:instightful_interviews_app/features/auth/data/model/UserModel.dart';
import 'package:instightful_interviews_app/features/auth/data/repository/authRepositoryImpl.dart';
import 'package:instightful_interviews_app/routes/route_names.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

    final TextEditingController _username = TextEditingController();
    final TextEditingController _password = TextEditingController();
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: SafeArea(
          child: Container(
            alignment: Alignment.center,
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child:
               Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Container(
                          width: width,
                          alignment: Alignment.center,
                          child:  appLogo(width: 200),),
                         SizedBox(height: width * 0.1,),
                        Container(
                          width: width * 0.9,
                          alignment: Alignment.center,
                          child:  MyTexts.h3("Welcome Back"),),
                          myInpField(label: "Email", controller: _username,),
                          myInpField(label: "Password", controller: _password, ispassword: true),
                          PrimaryBtn(label: "Continue", onpress: ()async{

                            //TODO: call api methods to login
                            AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl();
                           final loginOrError = await authRepositoryImpl.loginUser(username: _username.text, password: _password.text);

                           loginOrError.fold((l) {

                            // MyWidgets.showSnackbar(msg: "Error!", context: context);
                           }, (r) async{
                           //storing email in secure storage
                              await StorageHelper.setUserToken(r.email);
                            
                            // delayed for loading 
                            await Future.delayed(Duration(seconds: 1));
                            Get.offAllNamed(RoutesNames.landingPage);
                           });
                          }),
                         const SizedBox(
                            height: 20,
                          ),
                     
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      MyTexts.body3("Don't have an Account ?"),
                      const SizedBox(width: 5,),
                      GestureDetector(
                        onTap: (){
                          Get.offAndToNamed(RoutesNames.signupScreen);
                        },
                        child: MyTexts.h5("Sign Up ", color: AppColors.kSecondary)),
                     ],),
                         const  SizedBox(
                            height: 20,
                          ),

                        ],
                      ),
                    ),
            ),
          ),
        ),
    
    );
  }
}

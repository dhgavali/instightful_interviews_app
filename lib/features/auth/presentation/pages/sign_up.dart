
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instightful_interviews_app/core/components/exports.dart';
import 'package:instightful_interviews_app/features/auth/data/repository/authRepositoryImpl.dart';
import 'package:instightful_interviews_app/features/auth/domain/DTO/SignupDTO.dart';
import 'package:instightful_interviews_app/routes/route_names.dart';

class SignUpPage extends StatefulWidget {
   SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool isAccepted = false; 

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
                         appLogo(width: 200),
                           SizedBox(height: width * 0.05,),
                        Container(
                          padding:  EdgeInsets.symmetric(horizontal: width * 0.08,),
                          alignment: Alignment.centerLeft,child:  MyTexts.h3("Get Started!"),),
                        Container(
                          padding:  EdgeInsets.symmetric(horizontal: width * 0.08),
                          alignment: Alignment.centerLeft,child:  MyTexts.h3("Register for free!"),),
                          SizedBox(height: width * 0.05,),
                          myInpField(label: "Full Name", controller: _fullname,),
                          myInpField(label: "Email", controller: _email, keytype: TextInputType.emailAddress),
                          myInpField(label: "Mobile No", controller: _mobile, keytype: TextInputType.phone),
                          myInpField(label: "Password", controller: _password, ispassword: true,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: width * 0.08,),
                            Checkbox(value: isAccepted, onChanged: ((value) => {


                          }),  ),
                          MyTexts.body4("Accepts terms & conditions")
,                          ],
                         ),

                          SizedBox(height: 10,),
                     
                          PrimaryBtn(label: "Continue", onpress: () async{
                             SignupDTO signupDTO =  SignupDTO(_email.text, _password.text, _email.text,  _fullname.text.split(" ").first, _fullname.text.split(" ").last, "student");
                            AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl();
                           final signupOrError = await authRepositoryImpl.signUpUser(dto: signupDTO);

                           signupOrError.fold((l) {

                            MyWidgets.showSnackbar(msg: "Error!", context: context);
                           }, (r) async{
                            print("sucesss");

                            MyWidgets.showSnackbar(msg: "Account Created Successfully", context: context);
                            await Future.delayed(Duration(seconds: 1));
                            Get.offAndToNamed(RoutesNames.loginScreen);
                           });
                          }),
                         

                       
                          SizedBox(height: 10,),
                     
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      MyTexts.body3("Already a User?"),
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: (){
                          Get.offAndToNamed(RoutesNames.loginScreen);
                        },
                        child: MyTexts.h5("Login", color: AppColors.kSecondary)),
                     ],),
                          SizedBox(
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
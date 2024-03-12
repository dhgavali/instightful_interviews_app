import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instightful_interviews_app/core/components/datePicker.dart';
import 'package:instightful_interviews_app/core/components/exports.dart';
import 'package:instightful_interviews_app/core/secure_storage.dart';
import 'package:instightful_interviews_app/features/auth/data/repository/authRepositoryImpl.dart';
import 'package:instightful_interviews_app/features/auth/domain/entity/user_model.dart';
import 'package:instightful_interviews_app/features/interview/presentation/controller/date_controller.dart';
import 'package:instightful_interviews_app/features/interview/presentation/controller/gender_controller.dart';
import 'package:instightful_interviews_app/routes/route_names.dart';

class ProfilePage extends StatelessWidget {

   ProfilePage({super.key});

Map<String, dynamic> data = { "username": "string",
  "email": "dhirajpawar@gmail.com",
  "first_name": "Dhiraj",
  "last_name": "Pawar",
  "role": "Student",

  };


//method to load api data for future builder
Future<User?> loadData(BuildContext context) async{
                            AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl();
                            String? username = await StorageHelper.getUserToken();
                           final dataOrError = await authRepositoryImpl.getUserDetails(username: username!);
                           dataOrError.fold((l) {
                            // MyWidgets.showSnackbar(msg: "Error!", context: context);
                            return null;
                           }, (r) async{
                            // print("sucesss");
                            MyWidgets.showSnackbar(msg: "Profile Data loaded", context: context);
                            return r;
                           });
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
 appBar: AppBar( title: MyTexts.h3("Profile",
     ),
     centerTitle: false,
   actions:  [
    
    GestureDetector(
      onTap: (){
        Get.offAllNamed(RoutesNames.onboard);
      },
      child: Padding(
         padding:  EdgeInsets.symmetric(horizontal: 20.0),
         child: Icon(Icons.logout),
       ),
    ),
     ],), 
     
body: Container(
  padding: EdgeInsets.symmetric(horizontal: 16),

  child: 
SingleChildScrollView(
  child: FutureBuilder(
    future: loadData(context),
    builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done){
        print(1);
        if(snapshot.hasData){
          print(2);
          // User? user = snapshot.data;
          // print(user);
          // if(user != null){
            // return Profile(user: user,);
          // }
        //   else{
        //     Get.snackbar(
        //   'User Not Found',
        //   'Please try again letter',
        //   backgroundColor: Colors.red,
        //   colorText: Colors.white,
        // );
            // return Container();
          // }
        }
      }
      return Loadings.basic();
      
    }
  ),
)
  ),
      );
  }
}

class Profile extends StatelessWidget {
     final GenderController genderController = Get.put(GenderController());
     final DateController dateController = Get.put(DateController());
  final User user; 
   Profile({
    super.key,
    required this.user
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
      const Center(
        child: CircleAvatar(backgroundColor: AppColors.Kgray,
        radius: 50,
        foregroundImage: AssetImage("assets/icons/user.png"),
        ),
      ),
      SizedBox(height: 10,),
      MyTexts.h3(user.firstName + " " + user.lastName),
      SizedBox(height: 10,),
      MyTexts.body1(user.role),
    Divider(),
    SizedBox(height: 10,),
     Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      alignment: Alignment.centerLeft,child:  MyTexts.body2("Email"),),
    
    myInpField(label: user.email, controller: new TextEditingController(), width: width * 0.85),
    SizedBox(height: 10,),
     Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      alignment: Alignment.centerLeft,child:  MyTexts.body2("Phone"),),
    
    myInpField(label: "+91 8982382289", controller: new TextEditingController(), width: width * 0.85),
    SizedBox(height: 10,),
     Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      alignment: Alignment.centerLeft,child:  MyTexts.body2("Date of Birth"),),

     Obx(() => Container(
      width: width * 0.85,
       child: TextField(
   
        readOnly: true,
        decoration: InputDecoration(
          hintText: dateController.selectedDate.value == "" ? "choose date" : dateController.selectedDate.value,
          border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(8)
        ), contentPadding: EdgeInsets.symmetric(horizontal: 16),
         fillColor: AppColors.kPrimary,
         ),
         
       onTap:()async{  print("button tape");

          DateTime? datetime = await selectDate(context);
          if(datetime!=null){
            dateController.updateDate(datetime.toIso8601String().split("T").first);
          }
          print(datetime);} ,
       
        
        ),
     ),), 

     Container(
      width: width,
       child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => Container(
                  width: width * 0.4,
                  child: RadioListTile(
                    
                    title: Text('Male'),
                    value: 'Male',
                    groupValue: genderController.selectedGender.value,
                    onChanged: (value) {
                      genderController.updateSelectedGender(value.toString());
                    },
                  ),
                ),
              ),
              Obx(
                () => Container(
                  width: width * 0.4,
                  child: RadioListTile(
                    title: Text('Female'),
                    value: 'Female',
                    groupValue: genderController.selectedGender.value,
                    onChanged: (value) {
                      genderController.updateSelectedGender(value.toString());
                    },
                  ),
                ),
              ),
        ]),
     ),

    SizedBox(height: 10,),
     Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      alignment: Alignment.centerLeft,child:  MyTexts.body2("College Name"),),
    
    
    myInpField(label:"Pimpri Chinchwad College of Engineering", controller: new TextEditingController(), width: width * 0.85),
    SizedBox(height: 10,),
     Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      alignment: Alignment.centerLeft,child:  MyTexts.body2("Branch / Major"),),
    
    myInpField(label: "Information Technology", controller: new TextEditingController(), width: width * 0.85),
        SizedBox(height: 20,),

  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      PrimaryBtn(label: "Update", onpress: (){}, width: width * 0.8,),
     
    ],
  )
    
    ]     );
  }
}
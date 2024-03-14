

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instightful_interviews_app/core/components/buttons.dart';
import 'package:instightful_interviews_app/core/components/datePicker.dart';
import 'package:instightful_interviews_app/core/components/myColors.dart';
import 'package:instightful_interviews_app/core/components/text_field.dart';
import 'package:instightful_interviews_app/core/components/text_styles.dart';
import 'package:instightful_interviews_app/features/auth/domain/entity/user_model.dart';
import 'package:instightful_interviews_app/features/interview/presentation/controller/date_controller.dart';
import 'package:instightful_interviews_app/features/interview/presentation/controller/gender_controller.dart';

class EditProfile extends StatelessWidget {
     final GenderController genderController = Get.put(GenderController());
     final DateController dateController = Get.put(DateController());
  // final User user; 
   
    final     User user = User(username: "dhgavali", email: "dhgavali@gmail.com", password: "123", firstName: "Dhananjay", lastName: "Gavali", role: "student");
   
   EditProfile({
    super.key,
    // required this.user
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
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:instightful_interviews_app/core/components/exports.dart';
import 'package:instightful_interviews_app/features/interview/presentation/controller/type_ahead_controller.dart';
import 'package:instightful_interviews_app/routes/route_names.dart';

class StepOne extends StatefulWidget {
  StepOne({super.key});

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
   final TypeAheadController controller = Get.put(TypeAheadController());

  final List<String> suggestions = ['java', 'flutter', 'python', 'cpp', 'operating system', 'dbms'];
  Set<String> selectedTopis = Set<String>();


  List<String> roleList = [
    "Front End Developer",
    "Backend Developer",
    "Cloud Developer"
  ];
  List<String> difficultyList = ["Easy", "Medium", "Advance"];

  String selectedRole = "Front End Developer";
  String selectedDifficulty = "Easy";
  

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
 appBar: AppBar( title: MyTexts.h3("Intellivue",
     ),
   actions: const [Padding(
       padding:  EdgeInsets.symmetric(horizontal: 20.0),
       child: Icon(Icons.notifications_active),
     )],),
     floatingActionButton:   PrimaryBtn(label: "Next", onpress: (){
            // TODO: Data of form to take user input for promts
             Map<String, String> formOneData = {
                "role" : selectedRole,
                "difficulty" : selectedDifficulty,
                "topics" : controller.selectedValues.toList().toString(),
              };
             
            // navigate to second step for displaying camera and instructions
              Get.toNamed(RoutesNames.stepTwo);
            }),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Container(
          width: width,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.centerLeft,
                child: MyTexts.body1("Role",
                    color: AppColors.Kgray, textAlign: TextAlign.start),
              ),
              CustomDropdown(
                  items: roleList,
                  value: selectedRole,
                  onChanged: (value) {
                    setState(() {
                      selectedRole = value!;
                    });
                  }),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.centerLeft,
                child: MyTexts.body1("Difficulty",
                    color: AppColors.Kgray, textAlign: TextAlign.start),
              ),
              CustomDropdown(
                  items: difficultyList,
                  value: selectedDifficulty,
                  onChanged: (value) {
                    setState(() {
                      selectedDifficulty = value!;
                    });
                  }),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.centerLeft,
                child: MyTexts.body1("Select Topics",
                    color: AppColors.Kgray, textAlign: TextAlign.start),
              ),

              Container(
                width: width * 0.85,
                decoration: BoxDecoration(border: Border.all(color: AppColors.KlightGray), borderRadius: BorderRadius.circular(8)),
                child: TypeAheadField<String>(

                  suggestionsCallback: (pattern) {
                    return suggestions.where((language) => language.toLowerCase().contains(pattern.toLowerCase())).toList();
                  },
                  
                  itemBuilder: (context, suggestion) {
                    
                    return ListTile(
                      tileColor: AppColors.Kwhite.withOpacity(0),
                      title: Text(suggestion),
                      
                    );
                  },
                  onSelected: (suggestion) {
                    controller.addSelectedValue(suggestion);
                
                  },
                ),
              ),
           Obx(() => Wrap(
             children: controller.selectedValues.map((value) {
               return GestureDetector(
                 onTap: (){
                   controller.removeSelectedValue(value);
                 },
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 4.0),
                   child: Chip(
                     label: Text(value),
  
                   ),
                 ),
               );
             }).toList(),
           )),
           
            ],
          ),
        ),
      ),
    );
  }
}

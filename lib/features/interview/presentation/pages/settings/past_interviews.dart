import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instightful_interviews_app/core/components/exports.dart';
import 'package:instightful_interviews_app/routes/route_names.dart';

class PastInterview extends StatelessWidget {
   PastInterview({super.key});



List<String> interviews = ["Frontend Engineering", "AI Developer", "Python Developer"];
Future<bool> getInterview()async{
await Future.delayed(Duration(seconds: 2));
  return true;
}
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
  backgroundColor: AppColors.klightBg,  
      body: SafeArea(

        child: 
      Column(
        children: [
          SizedBox(height: 30.h,),
          Container(
            child: MyTexts.h3("Past Interviews"),
          ),
          SizedBox(height: 30.h,),

          Expanded(
            child: FutureBuilder(
              future: getInterview(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
          
            return 
            GestureDetector(
              onTap: (){
                 Get.toNamed(RoutesNames.result);
              },
              child: Container(
                width: width * 0.8,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(border: Border.all(color: AppColors.Kwhite, ), color:AppColors.kpureWhite, borderRadius:  BorderRadius.circular(20)),
                child: ListTile(
                
                  contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  leading: Container(
                    padding: EdgeInsets.all(10),
                    margin:  EdgeInsets.all(8),
                    decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.kdark,),
                    
                    child: Text("${index+1}", style: TextStyle(color: AppColors.kpureWhite),), ),
                    title: MyTexts.h3(interviews[index]),
                    subtitle: Text("${DateTime.now().day - index}" + "/" + DateTime.now().month.toString() + "/" + DateTime.now().year.toString()),
                ),
              ),
            );
              },);
          }
                }
                return Center(child: Loadings.basic(),);
                
              },
          
            ),
          ),
        ],
      )),
     );
  }
}
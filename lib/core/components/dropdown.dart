import 'package:flutter/material.dart';
import 'package:instightful_interviews_app/core/components/myColors.dart';
import 'package:instightful_interviews_app/core/components/text_styles.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String value;
  final Function (String?) onChanged;

  CustomDropdown({
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.9,
      padding: EdgeInsets.symmetric(horizontal: 16,),
    decoration: BoxDecoration(border: Border.all(color: AppColors.Kgray.withOpacity(0.2),), borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: DropdownButton<String>(
        alignment: Alignment.center,
        borderRadius: BorderRadius.circular(10),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        underline: Container(),
     
       icon: Icon(Icons.keyboard_arrow_down_rounded),
       isExpanded: true,
        value: value,
        onChanged: onChanged,
        
        items: items.map<DropdownMenuItem<String>>((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: MyTexts.body2(item, color: AppColors.Kgray),

          );
        }).toList(),
      ),
    );
  }
}

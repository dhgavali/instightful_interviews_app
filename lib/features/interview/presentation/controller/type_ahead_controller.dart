import 'package:get/get.dart';

class TypeAheadController extends GetxController {
 var selectedValues = <String>[].obs;

  void addSelectedValue(String value) {
    if (!selectedValues.contains(value)) {
      selectedValues.add(value);
    }
  }

  void removeSelectedValue(String value){
    if(selectedValues.contains(value)){
      selectedValues.remove(value);
    }
  }
}
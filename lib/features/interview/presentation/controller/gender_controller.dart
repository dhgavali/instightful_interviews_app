import 'package:get/get.dart';

class GenderController extends GetxController {
  var selectedGender = 'Male'.obs;

  void updateSelectedGender(String gender) {
    selectedGender.value = gender;
  }
}
import 'package:get/get.dart';
class DateController extends GetxController {
  var selectedDate = ''.obs;

  void updateDate(String date) {
    selectedDate.value = date;
  }
}
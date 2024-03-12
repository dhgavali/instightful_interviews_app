import 'package:get/get.dart';

class TermsController extends GetxController{
  RxBool isChecked = false.obs;

  updateChecked(value){
    isChecked.value = value;

  }
  
}
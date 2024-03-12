import 'package:get/get.dart';

class PageIndexController extends GetxController{
  RxInt pageIndex = 0.obs;


  void setPageIndex(int value){
    pageIndex.value = value;
  }


}
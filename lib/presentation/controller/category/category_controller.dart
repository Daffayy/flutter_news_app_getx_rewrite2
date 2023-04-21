import 'package:get/get.dart';


class CategoryController extends GetxController{
  RxString category = ''.obs;

  void getCategoryNews(String value){
    category.value = value;
  }
}
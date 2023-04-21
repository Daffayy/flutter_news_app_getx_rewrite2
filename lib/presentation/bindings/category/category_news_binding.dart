import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../controller/category/category_controller.dart';

class CategoryBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<CategoryController>(() => CategoryController(
    ));
  }
}
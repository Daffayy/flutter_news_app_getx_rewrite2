import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../domain/entities/utils.dart';
import '../../../infrastructure/navigation/routes.dart';
import '../../controller/category/category_controller.dart';

class CategoryPage extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Hello, Welcome to Exitogoi News',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Please,choose a thing that interests you',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 5,
                    child: GridView.builder(
                        physics: PageScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: listOfCategory.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: GestureDetector(
                              onTap: () async {
                                controller.category.value =
                                listOfCategory[index]['code']!;
                                Get.toNamed(Routes.CHANNEL,
                                    arguments: controller.category.value);
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      listOfCategory[index]['images']!,
                                      height: 50,
                                      width: 50,
                                    ),
                                    Text(
                                      listOfCategory[index]['name']!,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
              ),
            ],
          ),
        ));
  }
}
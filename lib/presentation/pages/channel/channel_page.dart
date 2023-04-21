import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/core/constants/color_constants.dart';
import '../../../domain/core/constants/content_constants.dart';
import '../../../infrastructure/navigation/routes.dart';
import '../../controller/channel/channel_controller.dart';

class ChannelPage extends GetView<ChannelController>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: fontContent),
        backgroundColor: transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(ContentConstants.channel,style: TextStyle(
            color: fontContent
        )),
      ),
      body: Obx(
            () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Swiper(
          itemCount: controller.sourceAppModel.sources!.length,
          itemBuilder: (BuildContext context, int itemIndex) {
            // final source = controller.sourceAppModel.sources![itemIndex];
            return Padding(
              padding: EdgeInsets.only(left: 50,right: 50,top: 150,bottom:
              150),
              child: Container(
                  height: 60, // reduce height to 60 pixels
                  width: 80, // keep the width the same
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: onSurfaceTextColor.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        )
                      ],
                      borderRadius: BorderRadius.circular(30),
                      color: transparent
                  ),
                  child: Center(
                      child: GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.LISTNEWS,arguments:
                            controller.sourceAppModel.sources![itemIndex]
                                .id);
                          },
                          child: Container(
                              child: Text
                                (controller.sourceAppModel
                                  .sources![itemIndex]
                                  .name!,
                                style: TextStyle(
                                  fontSize: 50,
                                ),
                                textAlign: TextAlign.center,
                              )
                          )
                      )
                  )
              ),
            );
          },
          pagination: SwiperPagination(
            margin: EdgeInsets.only(bottom: 80),
          ),
        ),
      ),
    );
  }
}
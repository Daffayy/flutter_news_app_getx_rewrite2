import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

import '../../../domain/core/constants/color_constants.dart';
import '../../../domain/core/constants/content_constants.dart';
import '../../../infrastructure/navigation/routes.dart';
import '../../controller/list_news/list_news_controller.dart';
import '../news/news_page.dart';

class ListNewsPage extends GetView<ListNewsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F8),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(ContentConstants.news, style: TextStyle(color: Colors.black)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.SEARCH);
              },
              child: Icon(
                Icons.search_sharp,
                color: fontContent,
              ),
            ),
          ),
        ],
      ),
      body: GetBuilder<ListNewsController>(
        builder: (controller) {
          return controller.isLoading.value
              ? SkeletonListView()
              : ListView.builder(
            controller: controller.scrollController,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(NewsPage(
                              newsUrl: controller.newsAppModel.articles![index]
                                  .url));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(30)),
                          child: Column(
                            children: [
                              Stack(children: [
                                controller.newsAppModel.articles![index].urlToImage ==
                                    null
                                    ? Container()
                                    : ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                    placeholder: (context,
                                        url) =>
                                        Container(
                                            child:
                                            CircularProgressIndicator()),
                                    errorWidget:
                                        (context, url, error) =>
                                        Icon(Icons.error),
                                    imageUrl:controller.newsAppModel.articles![index]
                                        .urlToImage ??
                                        '',
                                  ),
                                ),
                                Positioned(
                                  bottom: 8,
                                  right: 8,
                                  child: Card(
                                    elevation: 0,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.8),
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 8),
                                      child: Text(
                                          "${controller.newsAppModel.articles![index].source!.name!}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2),
                                    ),
                                  ),
                                ),
                              ]),
                              Divider(),
                              Text("${controller.newsAppModel.articles![index].title}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  index == controller.newsAppModel.articles!.length - 1 &&
                      controller.isLoading == true
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox(),
                ],
              );
            },
            itemCount: controller.newsAppModel.articles!.length,
          );
        },
      ),
    );
  }
}
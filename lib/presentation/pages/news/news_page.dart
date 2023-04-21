
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../domain/core/constants/color_constants.dart';
import '../../../domain/core/constants/content_constants.dart';
import '../../controller/list_news/list_news_controller.dart';

class NewsPage extends GetView<ListNewsController>{
  final newsUrl;

  const NewsPage({Key? key, this.newsUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
          backgroundColor: Color(0xFFF5F5F8),
          centerTitle: true,
          title: Text(ContentConstants.news,style: TextStyle(
            color: fontContent,
          ))
      ),
      body: Container(child: WebView(initialUrl: newsUrl, javascriptMode: JavascriptMode.unrestricted)),
    );
  }
}
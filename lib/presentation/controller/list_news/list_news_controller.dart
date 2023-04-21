import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../domain/entities/news_app_model.dart';
import '../../../domain/use_case/list_news/list_news_use_case.dart';

class ListNewsController extends GetxController{
  late String arguments ;
  final ListNewsUseCase _listNewsUseCase;
  final newsAppModel = NewsAppModel();
  RxBool isLoading = false.obs;
  RxBool notFound = false.obs;
  ScrollController scrollController = ScrollController();

  ListNewsController(this._listNewsUseCase);

  @override
  void onInit() {
    arguments = Get.arguments;
    getListNews(id: arguments);
    super.onInit();
  }

  Future<void> getListNews({required String id}) async {
    isLoading.toggle();
    try {
      final response = await _listNewsUseCase.call(id: id);
      newsAppModel.articles = response.articles;
      isLoading.value = false;
      update();
    } catch (e) {
      isLoading.value = false;
    }
  }

}
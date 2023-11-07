import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/news_app_model.dart';
import '../../../domain/use_case/search/search_use_case.dart';

class MySearchController extends GetxController{
  ScrollController scrollController = ScrollController();
  final SearchUseCase _searchUseCase;
  RxBool isLoading = false.obs;
  RxList<Article> searchNewsItem = <Article>[].obs;

  MySearchController(this._searchUseCase);

  Future<void> getSearchNews({required String searchFood}) async {
    isLoading.toggle();
    searchNewsItem.clear();
    searchFood.toLowerCase();
    try {
      final responseSearch =
      await _searchUseCase.call(searchParams: searchFood);
      searchNewsItem.addAll(responseSearch.articles!);
      isLoading.toggle();
    } catch (e) {
      isLoading.toggle();
    }
  }
}
import 'package:flutter_news_app_getx_rewrite2/domain/entities/news_app_model.dart';
import 'package:flutter_news_app_getx_rewrite2/domain/entities/source_app_model.dart';
import 'package:get/get_connect/connect.dart';

import '../../../../domain/core/constants/storage_constants.dart';

class RemoteNewsDataSource{
  final GetConnect _connect;

  RemoteNewsDataSource({required GetConnect connect}) : _connect = connect;

  Future<SourceAppModel> getNewsRes({required String category}) async {
    final url = "top-headlines?country=in&category=$category&${StorageConstants.token}";
    final response = await _connect.get(
      url,
      decoder: (data) => SourceAppModel.fromJson(data),
    );
    if (!response.hasError) {
      return response.body!;
    } else {
      throw Exception('error');
    }
  }
  Future<SourceAppModel> getChannelRes({required String channel}) async {
    final response = await _connect.get(
      "top-headlines/sources?category=$channel&apiKey=2c06313242f34a50812b97111fea7f2f",
      decoder: (data) => SourceAppModel.fromJson(data),
    );
    if (!response.hasError) {
      return response.body!;
    } else {
      throw Exception('error');
    }
  }
  Future<NewsAppModel> getListNewsRes({required String id}) async {
    final response = await _connect.get(
      "everything?sources=$id&apiKey=2c06313242f34a50812b97111fea7f2f",
      decoder: (data) => NewsAppModel.fromJson(data),
    );
    if (!response.hasError) {
      return response.body!;
    } else {
      throw Exception('error');
    }
  }
  Future<NewsAppModel> doGetSearchNews({required String searchParams}) async {
    final response = await _connect.get(
      "everything?q=$searchParams&apiKey=2c06313242f34a50812b97111fea7f2f",
      decoder: (data) => NewsAppModel.fromJson(data),
    );
    if (!response.hasError) {
      return response.body!;
    } else {
      throw Exception('error');
    }
  }
}
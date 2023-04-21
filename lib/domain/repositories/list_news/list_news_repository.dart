import '../../entities/news_app_model.dart';

abstract class ListNewsRepository{
  Future<NewsAppModel> getListNewsRes({required String id});
}
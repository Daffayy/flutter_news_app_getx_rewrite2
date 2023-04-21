import 'package:flutter_news_app_getx_rewrite2/domain/entities/source_app_model.dart';

abstract class CategoryRepository{
  Future<SourceAppModel> getCategory({required String category});
}
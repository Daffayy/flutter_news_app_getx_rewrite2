import 'package:flutter_news_app_getx_rewrite2/domain/entities/source_app_model.dart';

import '../../../../domain/repositories/category/category_repository.dart';
import '../../data_source/remote/remote_news_data_source.dart';

class CategoryRepositoryImpl implements CategoryRepository{
  final RemoteNewsDataSource _remoteNewsDataSource;

  CategoryRepositoryImpl(this._remoteNewsDataSource);

  @override
  Future<SourceAppModel> getCategory({required String category}){
    return _remoteNewsDataSource.getNewsRes(category: category);
  }
}
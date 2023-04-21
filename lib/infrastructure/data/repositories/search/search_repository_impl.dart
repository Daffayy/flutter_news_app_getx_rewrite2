import '../../../../domain/entities/news_app_model.dart';
import '../../../../domain/repositories/search/search_repository.dart';
import '../../data_source/remote/remote_news_data_source.dart';

class SearchRepositoryImpl implements SearchRepository{
  final RemoteNewsDataSource _remoteNewsDataSource;

  SearchRepositoryImpl(this._remoteNewsDataSource);

  @override
  Future<NewsAppModel> doGetSearchNews({required String searchParams}) {
    return _remoteNewsDataSource.doGetSearchNews(searchParams: searchParams);
  }
}
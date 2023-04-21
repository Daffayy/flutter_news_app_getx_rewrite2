import '../../../../domain/entities/news_app_model.dart';
import '../../../../domain/repositories/list_news/list_news_repository.dart';
import '../../data_source/remote/remote_news_data_source.dart';

class ListNewsRepositoryImpl implements ListNewsRepository {
  final RemoteNewsDataSource _remoteNewsDataSource;

  ListNewsRepositoryImpl(this._remoteNewsDataSource);

  @override
  Future<NewsAppModel> getListNewsRes({required String id}) async {
    return await _remoteNewsDataSource.getListNewsRes(id: id);
  }
}
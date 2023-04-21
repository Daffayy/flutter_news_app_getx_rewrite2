import '../../entities/news_app_model.dart';
import '../../repositories/list_news/list_news_repository.dart';

class ListNewsUseCase {
  final ListNewsRepository _listNewsRepository;

  ListNewsUseCase(this._listNewsRepository);

  Future<NewsAppModel> call({required String id}) {
    return _listNewsRepository.getListNewsRes(id: id);
  }
}
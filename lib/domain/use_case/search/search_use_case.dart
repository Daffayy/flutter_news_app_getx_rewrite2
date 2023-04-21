import '../../entities/news_app_model.dart';
import '../../repositories/search/search_repository.dart';

class SearchUseCase {
  final SearchRepository _repository;

  const SearchUseCase({required SearchRepository repository})
      : _repository = repository;

  Future<NewsAppModel> call({required String searchParams}) async {
    return await _repository.doGetSearchNews(searchParams: searchParams);
  }
}
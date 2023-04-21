import 'package:flutter_news_app_getx_rewrite2/domain/entities/source_app_model.dart';

import '../../repositories/category/category_repository.dart';

class CategoryUseCase {
  final CategoryRepository _categoryRepository;

  CategoryUseCase(this._categoryRepository);

  Future<SourceAppModel>call({required String category})async{
    return await _categoryRepository.getCategory(category: category);
  }
}
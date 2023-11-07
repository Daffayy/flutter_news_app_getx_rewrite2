import 'package:get/get.dart';
import '../../../domain/repositories/search/search_repository.dart';
import '../../../domain/use_case/search/search_use_case.dart';
import '../../../infrastructure/data/data_source/remote/remote_news_data_source.dart';
import '../../../infrastructure/data/repositories/search/search_repository_impl.dart';
import '../../controller/search/search_controller.dart';

class SearchBinding extends Bindings{

  @override
  void dependencies(){
    Get.lazyPut<RemoteNewsDataSource>(() => RemoteNewsDataSource(connect:Get
        .find<GetConnect>()));
    Get.lazyPut<SearchRepository>(
            () => SearchRepositoryImpl(Get.find<RemoteNewsDataSource>()));
    Get.lazyPut<SearchUseCase>(
            () => SearchUseCase(repository: Get.find<SearchRepository>()));
    Get.lazyPut<MySearchController>(
            () => MySearchController(
            Get.find<SearchUseCase>()
        ));
  }
}
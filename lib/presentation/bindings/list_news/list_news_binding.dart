import 'package:get/get.dart';

import '../../../domain/repositories/list_news/list_news_repository.dart';
import '../../../domain/use_case/list_news/list_news_use_case.dart';
import '../../../infrastructure/data/data_source/remote/remote_news_data_source.dart';
import '../../../infrastructure/data/repositories/list_news/list_news_repository_impl.dart';
import '../../controller/list_news/list_news_controller.dart';

class ListNewsBinding extends Bindings{

  @override
  void dependencies(){
    Get.lazyPut<RemoteNewsDataSource>(() => RemoteNewsDataSource(connect:Get
        .find<GetConnect>()));
    Get.lazyPut<ListNewsRepository>(() => ListNewsRepositoryImpl(Get.find<RemoteNewsDataSource>()));
    Get.lazyPut<ListNewsUseCase>(() => ListNewsUseCase(Get
        .find<ListNewsRepository>()));
    Get.lazyPut<ListNewsController>(() => ListNewsController(
        Get.find<ListNewsUseCase>()
    ));
  }
}
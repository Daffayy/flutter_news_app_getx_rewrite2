import 'package:get/get.dart';
import '../../../domain/repositories/channel/channel_repository.dart';
import '../../../domain/use_case/channel/channel_use_case.dart';
import '../../../infrastructure/data/data_source/remote/remote_news_data_source.dart';
import '../../../infrastructure/data/repositories/channel/channel_repository_impl.dart';
import '../../controller/channel/channel_controller.dart';

class ChannelBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<RemoteNewsDataSource>(() => RemoteNewsDataSource(connect:Get
        .find<GetConnect>()));
    Get.lazyPut<ChannelRepository>(() => ChannelRepositoryImpl(remoteNewsDataSource: Get.find<RemoteNewsDataSource>
      ()));
    Get.lazyPut<ChannelUseCase>(() => ChannelUseCase(Get.find<ChannelRepository>()));
    Get.lazyPut<ChannelController>(() => ChannelController(
        Get.find<ChannelUseCase>()
    ));
  }
}
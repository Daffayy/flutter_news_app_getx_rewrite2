import '../../entities/source_app_model.dart';

abstract class ChannelRepository {
  Future<SourceAppModel> getChannelRes({required String channel});
}
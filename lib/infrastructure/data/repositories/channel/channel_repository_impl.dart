import '../../../../domain/entities/source_app_model.dart';
import '../../../../domain/repositories/channel/channel_repository.dart';
import '../../data_source/remote/remote_news_data_source.dart';

class ChannelRepositoryImpl extends ChannelRepository {
  final RemoteNewsDataSource remoteNewsDataSource;

  ChannelRepositoryImpl({required this.remoteNewsDataSource});

  @override
  Future<SourceAppModel> getChannelRes({required String channel}) async {
    final result = await remoteNewsDataSource.getChannelRes(channel: channel);
    return result;
  }
}

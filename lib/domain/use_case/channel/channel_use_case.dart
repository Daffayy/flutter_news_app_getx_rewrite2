import '../../entities/source_app_model.dart';
import '../../repositories/channel/channel_repository.dart';

class ChannelUseCase {
  final ChannelRepository _channelRepository;

  ChannelUseCase(this._channelRepository);

  Future<SourceAppModel> call({required String channel}) async {
    return await _channelRepository.getChannelRes(channel: channel);
  }
}

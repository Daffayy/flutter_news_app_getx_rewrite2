import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/core/constants/snackbar_constants.dart';
import '../../../domain/entities/source_app_model.dart';
import '../../../domain/use_case/channel/channel_use_case.dart';

class ChannelController extends GetxController{
  final arguments = Get.arguments;
  final ChannelUseCase _channelUseCase;
  final sourceAppModel = SourceAppModel();
  ScrollController scrollController = ScrollController();
  RxBool isLoading = false.obs;
  RxString id = ''.obs;

  ChannelController(this._channelUseCase);

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(_scrollListener);
    getChannel(channel: arguments);
    super.onInit();
  }
  _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isLoading.value = true;
    }
  }

  Future<void> getChannel({required String channel}) async {
    isLoading.toggle();
    try {
      final response = await _channelUseCase.call(channel: channel);
      sourceAppModel.sources = response.sources;
      isLoading.value = false;
      update();
    } catch (e) {
      isLoading.value = false;
      Exception(SnackBarConstants.snackbarShowError);
    }
  }
}
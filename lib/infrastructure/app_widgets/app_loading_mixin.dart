import 'package:get/get.dart';

import '../../values/common_utils.dart';

mixin AppLoadingMixin {
  RxBool isLoading = false.obs;

  void showLoading() {
    isLoading.value = true;
  }

  void hideLoading() {
    isLoading.value = false;
  }

  void showGlobalLoading() {
    CommonUtils.hideShowLoadingIndicator(context: Get.context!, isShow: true);
  }

  void hideGlobalLoading() {
    CommonUtils.hideShowLoadingIndicator(context: Get.context!, isShow: false);
  }
}

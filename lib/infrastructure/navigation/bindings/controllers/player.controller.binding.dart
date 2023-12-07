import 'package:get/get.dart';

import '../../../../presentation/logout/controllers/player.controller.dart';
import '../../routes.dart';

class PlayerControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerController>(() => PlayerController(), tag: Routes.PLAYER);
  }
}

import 'package:demoproject/infrastructure/app_widgets/club_selection_tile_widget.dart';
import 'package:demoproject/model/PlayerNameModel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../infrastructure/navigation/routes.dart';
import '../../values/app_values.dart';
import 'controllers/player.controller.dart';

class PlayerScreen extends GetView<PlayerController> {
  PlayerController controller = Get.find(tag: Routes.PLAYER);

  PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Screen'),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(8), child: buildNotificationListWidget()),
    );
  }

  /// Build list widget.
  Widget buildNotificationListWidget() =>
      PagedListView<int, PlayerData>.separated(
        separatorBuilder: (_, ctx) => Container(
          height: AppValues.margin_10,
        ),
        pagingController: controller.pagingController,
        shrinkWrap: true,
        primary: true,
        // physics: const NeverScrollableScrollPhysics(),
        builderDelegate: PagedChildBuilderDelegate<PlayerData>(
            animateTransitions: true,
            newPageProgressIndicatorBuilder: (_) =>
                Center(child: Text("Loading")),
            itemBuilder: (context, item, index) {
              return ClubSelectionTileWidget(
                index: index,
                model: item,
              );
            }),
      );
}

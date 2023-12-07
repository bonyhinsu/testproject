import 'package:demoproject/presentation/logout/providers/player_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../infrastructure/network/network_config.dart';
import '../../../infrastructure/network/network_connectivity.dart';
import '../../../model/PlayerNameModel.dart';
import '../../../values/app_constant.dart';

class PlayerController extends GetxController {
  /// Paging controller
  final PagingController<int, PlayerData> pagingController =
      PagingController(firstPageKey: 1);

  /// provider
  final _provider = PlayerProvider();

  @override
  void onInit() {
    _setupPageListener();
    // _getPlayerAPI(1);
    super.onInit();
  }

  /// Page change listener.
  void _setupPageListener() {
    pagingController.addPageRequestListener((pageKey) {
      _getPlayerAPI(pageKey);
    });
  }

  /// Get Notification API.
  void _getPlayerAPI(int pageKey) async {
    if (await NetworkConnectivity.instance.hasNetwork()) {
      // showLoading();
      dio.Response? response = await _provider.getAllUserSelectedClubs(pageKey);
      if (response.data != null) {
        if (response.statusCode == NetworkConstants.success) {
          print("Response : ${response.data}");

          /// On success
          _getPostSuccess(response, pageKey);
        } else {
          /// On Error
          _getAPIError(response);
        }
      } else {
        // GetIt.I<CommonUtils>().showServerDownError();
      }
    } else {
      // hideLoading();
      // GetIt.I<CommonUtils>().showNetworkError();
    }
  }

  /// Perform api error.
  void _getAPIError(dio.Response response) {
    // hideLoading();
    pagingController.error = response.statusMessage;
    // GetIt.instance<ApiUtils>().parseErrorResponse(response);
  }

  void _getPostSuccess(dio.Response response, int pageKey) {
    try {
      PlayerNameModel postResponse = PlayerNameModel.fromJson(response.data!);
      bool isLastPage =
          (postResponse.playerData ?? []).length < AppConstants.pageSize;
      List<PlayerData> newItems = [];

      postResponse.playerData?.forEach((postElement) {
        newItems.add(_addDataToPostList(postElement));
      });
      // if (pageKey == 0) {
      //   enableReadAll.value = newItems.isNotEmpty;
      // }
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + AppConstants.pageSize;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (e) {
      // logger.e(e);
    }
    // hideLoading();
  }

  PlayerData _addDataToPostList(PlayerData notificationElement) {
    return PlayerData(
        firstName: notificationElement.firstName,
        id: notificationElement.id,
        lastName: notificationElement.lastName,
        avatar: notificationElement.avatar,
        email: notificationElement.email);
  }
}

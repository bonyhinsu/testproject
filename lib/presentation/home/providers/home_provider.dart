import 'package:demoproject/values/app_constant.dart';
import 'package:dio/dio.dart';

import '../../../infrastructure/network/dio_client.dart';
import '../../../infrastructure/network/network_config.dart';

class HomeProvider extends DioClient {
  Future<Response> getAllUserSelectedClubs() async {
    final Map<String, dynamic> body = {
      // NetworkParams.page: AppConstants.postTypeOpenPosition,
    };
    return getBaseApi(
      url: NetworkAPI.list,
    );
  }

  Future<Response> getUserData() async {
    final Map<String, dynamic> body = {
      // NetworkParams.page: AppConstants.postTypeOpenPosition,
    };
    return getBaseApi(
      url: NetworkAPI.userList,
    );
  }
}

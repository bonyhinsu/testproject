import 'package:demoproject/infrastructure/network/dio_client.dart';
import 'package:demoproject/infrastructure/network/network_config.dart';
import 'package:dio/dio.dart';

class PlayerProvider extends DioClient {
  Future<Response> getAllUserSelectedClubs(int pageKey) async {
    // Specify the parameters
    Map<String, dynamic> queryParameters = {
      'page': pageKey,
    };
    return getBaseApi(
      url: NetworkAPI.playerListBaseApi,
      queryParameters: queryParameters,
    );
  }
}

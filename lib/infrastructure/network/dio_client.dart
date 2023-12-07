import 'dart:io';

import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';

import '../../config/environment.dart';
import 'network_config.dart';

abstract class DioClient {

  final Dio _dio = Dio(BaseOptions(
    baseUrl: "",
    // headers: {
    //   if (PreferenceManager.instance.getAuthToken().isNotEmpty)
    //     NetworkParams.headerAuthToken:
    //         "${NetworkParams.bearer} ${PreferenceManager.instance.getAuthToken()}"
    // },
    connectTimeout: const Duration(minutes: 3),
    // 10 seconds
    validateStatus: (status) {
      return true;
    },
    receiveDataWhenStatusError: true,
  ))
    ..interceptors.add(
      AwesomeDioInterceptor(
        logRequestTimeout: false,
        logRequestHeaders: true,
        logResponseHeaders: false,
      ),
    );

  Future<Response> getBaseApi({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response userData = await _dio.get(url, queryParameters: queryParameters);
    return userData;
  }

  Future<Response> postBaseApi({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Response response = await _dio.post(url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
            contentType: ContentType.parse(NetworkConstants.formUrlContentType)
                .toString()));
    return response;
  }

  Future<Response> postBaseApiForMultipart({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response =
        await _dio.post(url, data: data, queryParameters: queryParameters);
    return response;
  }

  Future<Response> deleteBaseApi({
    required String url,
  }) async {
    Response response = await _dio.delete(url);
    return response;
  }

  Future<Response> putConnectApi({
    required String url,
    dynamic data,
  }) async {
    Response response = await _dio.put(url, data: data);
    return response;
  }

  Future<Response> patchBaseApi({
    required String url,
    dynamic data,
  }) async {
    Response response = await _dio.put(
      url,
      data: data,
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    return response;
  }

  Future<Response> postApiWithoutHeader({
    required String url,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    Response userData = await _dio.post(url,
        queryParameters: queryParameters,
        data: data,
        options: Options(
            headers: null,
            contentType: ContentType.parse(NetworkConstants.formUrlContentType)
                .toString()));
    return userData;
  }
}

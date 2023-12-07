import 'dart:io';

import 'package:dio/dio.dart' as dio;

import '../../values/app_string.dart';
import '../../values/common_utils.dart';

class ApiUtils {
  ApiUtils._();

  static final _instance = ApiUtils._();

  static ApiUtils get instance => _instance;

  ///Calls when api fails return success.
  void parseErrorResponse(dio.Response? response, {bool isFromLogin = false}) {
    if (response == null) {
      /// When response is blank then shows error
      CommonUtils.showErrorSnackBar(message: AppString.noResponseMessage);
      return;
    } else {
      try {
        if (response.statusCode == HttpStatus.unauthorized) {
          if (isFromLogin) {
            CommonUtils.showErrorSnackBar(
                title: AppString.error,
                message: response.data["message"] ??
                    AppString.contactAdministratorMessage,
                seconds: 3);
          } else {
            // CommonUtils.logout();
          }
        } else if (response.data["message"] != null) {
          handleApiException(response.data["message"] ?? " ");
        } else if (response.data["data"] != null) {
          /*ApiExceptionModel model = ApiExceptionModel.fromJson(response.data);
          if (model.status == HttpStatus.unauthorized) {
            if (isFromLogin && model.data != null) {
              CommonUtils.showErrorSnackBar(
                  title: AppString.createAnAccount,
                  message: AppString.contactAdministratorMessage);
            } else {
              CommonUtils.logoutUserFromServer();
            }
            return;
          }
          if (model.data != null) {
            handleApiException(model.data!.message ?? " ");
          }*/
        } else {
          handleServerFailureException(response, isFromLogin);
        }
      } catch (ex) {
        handleServerFailureException(response, isFromLogin);
      }
    }
  }

  void handleApiException(String responseMessage) {
    CommonUtils.showErrorSnackBar(message: responseMessage);
  }

  void handleServerFailureException(dio.Response response, bool isFromLogin) {
    if (response.statusCode == HttpStatus.movedPermanently) {
      /// Throws when server is not reachable.
      CommonUtils.showErrorSnackBar(
          title: "", message: AppString.connectionErrorMovedTemporary);
    } else if (response.statusCode == 400) {
      /// Throws when server is not reachable.
      // CommonUtils.showConnectionError();
    } else if (response.statusCode == 500) {
      /// Throws when there is any server error.
      CommonUtils.showServerDownError();
    } else if (response.statusCode == 401) {
      /// Throws when token is expired or not valid.
      try {
        /*CommonModel model = CommonModel.fromJson(response.data);
        if (model.name?.toLowerCase() == "Unauthorized".toLowerCase()) {
          if (isFromLogin) {
            CommonUtils.showErrorSnackBar(
                title: "", message: model.message ?? " ");
          } else {
            CommonUtils.logoutUserFromServer();
          }
        } else {
          CommonUtils.showErrorSnackBar(
              title: "", message: model.message ?? " ");
        }*/
      } catch (ex) {
        CommonUtils.showErrorSnackBar(
            title: "", message: AppString.somethingWrongTryAgainAfterSometime);
      }
    } else if (response.statusCode == 404) {
      /// Throws when api endpoint not found.
      CommonUtils.showApiNotFoundError();
    } else {
      /// Throws when there were any error in api.
      CommonUtils.showErrorSnackBar(
          title: "", message: AppString.somethingWrongTryAgainAfterSometime);
    }
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

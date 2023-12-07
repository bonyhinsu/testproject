import 'dart:async';

import 'package:demoproject/infrastructure/app_widgets/app_loading_mixin.dart';
import 'package:demoproject/presentation/home/providers/home_provider.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../infrastructure/network/network_config.dart';
import '../../../infrastructure/network/network_connectivity.dart';
import '../../../model/FilteredDataClass.dart';
import '../../../model/UserListModel.dart';
import '../../../values/app_values.dart';

class HomeController extends GetxController with AppLoadingMixin {
  //TODO: Implement LoginController

  FocusNode searchFocusNode = FocusNode();
  Timer? searchOnStoppedTyping;
  FilteredDataClass filteredDataClass = new FilteredDataClass();
  RxList<FilteredDataClass> clubList = RxList();
  RxList<Data> userList = RxList();
  final RxList<FilteredDataClass> filteredClubList = <FilteredDataClass>[].obs;

  /// text editing controller.
  TextEditingController searchController = TextEditingController();

  final _provider = HomeProvider();

  @override
  void onInit() {
    showLoading();
    _getUserSelectedClubForProfilePrivacy();
    getUserData();
    super.onInit();
  }

  /// Get user posts API.
  void _getUserSelectedClubForProfilePrivacy() async {
    if (await NetworkConnectivity.instance.hasNetwork()) {
      dio.Response? response = await _provider.getAllUserSelectedClubs();
      if (response.data != null) {
        if (response.statusCode == NetworkConstants.success) {
          print("before data: ${clubList.length.toString()}");
          List<dynamic> responseData = response.data;
          clubList.value = responseData
              .map((json) => FilteredDataClass.fromJson(json))
              .toList();
          filteredClubList.assignAll(clubList);
          print("after data: ${clubList.length.toString()}");
        } else {
          /// On Error
          // _getAPIError(response);
        }
      } else {
        // GetIt.I<CommonUtils>().showServerDownError();
      }
    } else {
      // GetIt.I<CommonUtils>().showNetworkError();
    }
  }

  /// Get user posts API.
  void getUserData() async {
    if (await NetworkConnectivity.instance.hasNetwork()) {
      dio.Response? response = await _provider.getUserData();
      if (response.data != null) {
        if (response.statusCode == NetworkConstants.success) {
          print("user data1: ${response.data}");

          UserListModel userlistresponse =
              UserListModel.fromJson(response.data!);

          userlistresponse.data!.forEach((element) {
            userList.add(element);
          });
        } else {
          /// On Error
          // _getAPIError(response);
        }
      } else {
        // GetIt.I<CommonUtils>().showServerDownError();
      }
    } else {
      // GetIt.I<CommonUtils>().showNetworkError();
    }
  }

  List<FilteredDataClass> parseFilteredDataList(
      List<Map<String, dynamic>> jsonDataList) {
    return jsonDataList
        .map((json) => FilteredDataClass.fromJson(json))
        .toList();
  }

  void filterClubList(String query) {
    // Use the query to filter the club list
    if (query.isEmpty) {
      // If the query is empty, show the entire list
      filteredClubList.assignAll(clubList);
    } else {
      // If there is a query, filter the list based on the query
      filteredClubList.assignAll(
        clubList.where((club) =>
            club.address!.city.toString().contains(query) ||
            club.name?.toLowerCase().contains(query.toLowerCase()) == true),
      );
    }
  }

  /// Search for user by filter available list.
  void searchForUser(String value) {
    // _searchUser = value;
    // clubList.clear();
    // _getUserSelectedClubForProfilePrivacy(0);
  }
}

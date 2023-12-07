import 'package:demoproject/infrastructure/app_widgets/app_loading_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../infrastructure/app_widgets/app_textfield.dart';
import '../../infrastructure/app_widgets/base_view.dart';
import '../../infrastructure/app_widgets/club_selection_tile_widget.dart';
import '../../infrastructure/navigation/routes.dart';
import '../../model/FilteredDataClass.dart';
import '../../values/app_colors.dart';
import '../../values/app_icons.dart';
import '../../values/app_string.dart';
import '../../values/app_values.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController>
    with AppBarMixin, AppLoadingMixin {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController _controller = Get.find(tag: Routes.HOME);
  late TextTheme textTheme;
  late BuildContext buildContext;

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Demo'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSearchTextField(),
            SizedBox(height: 10),
            Text("Client List",
                textAlign: TextAlign.start,
                maxLines: 2,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColorWhite.withOpacity(0.7),
                  fontSize: 13,
                )),
            Expanded(
              child: buildClubList(),
            ),
            SizedBox(height: 10),
            Text("Employee List",
                textAlign: TextAlign.start,
                maxLines: 2,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColorWhite.withOpacity(0.7),
                  fontSize: 13,
                )),
            Expanded(
              child: buildUserList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildClubList() {
    return Obx(() {
      // Use a ListView.builder for the filtered club items
      return ListView.builder(
        itemCount: _controller.filteredClubList.length,
        itemBuilder: (BuildContext context, int index) {
          final club = _controller.filteredClubList[index];
          return Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.appTileBackground,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(club.id.toString() ?? ''),
                    Text(club.name ?? ""),
                    Text(club.company!.catchPhrase ?? '')
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }

  Widget buildUserList() {
    return Obx(() {
      // Use a ListView.builder for the filtered club items
      return ListView.builder(
        itemCount: _controller.userList.length,
        itemBuilder: (BuildContext context, int index) {
          final club = _controller.userList[index];
          return Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.appTileBackground,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(club.id.toString() ?? ""),
                    Text(club.employeeAge.toString() ?? ''),
                    Text(club.employeeName.toString() ?? '')
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }

  Widget buildSearchTextField() {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.smallRadius),
      ),
      child: AppTextField.underLineTextField(
        context: buildContext,
        backgroundColor: AppColors.appTileBackground,
        hintColor: AppColors.inputFieldBorderColor,
        enableFocusBorder: false,
        isFocused: _controller.searchFocusNode.hasFocus,
        contentPadding:
            const EdgeInsets.symmetric(vertical: AppValues.margin_10),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppString.fieldDoesNotEmptyMessage;
          }
          return null;
        },
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: AppValues.margin_15),
          child: SvgPicture.asset(
            AppIcons.searchIcon,
            height: AppValues.iconSize_18,
            width: AppValues.iconSize_18,
          ),
        ),
        maxLength: AppValues.textFieldMaxLength,
        controller: _controller.searchController,
        onTextChange: (query) {
          // Call a method to filter the club list based on the search query
          _controller.filterClubList(query);
        },
        focusNode: _controller.searchFocusNode,
      ),
    );
  }
}

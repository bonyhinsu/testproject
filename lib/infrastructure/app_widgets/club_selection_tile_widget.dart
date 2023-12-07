import 'package:demoproject/model/FilteredDataClass.dart';
import 'package:demoproject/model/PlayerNameModel.dart';
import 'package:flutter/material.dart';

import '../../values/app_colors.dart';
import '../../values/app_font_size.dart';
import '../../values/app_values.dart';

class ClubSelectionTileWidget extends StatelessWidget {
  PlayerData model;
  int index;

  ClubSelectionTileWidget({required this.model, required this.index, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                color: AppColors.appTileBackground,
                borderRadius: BorderRadius.circular(8)),
            child: buildTitleWidget())
      ],
    );
  }

  /// Build title widget
  Widget buildTitleWidget() => Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      color: AppColors.inputFieldBorderColor,
                      borderRadius:
                          BorderRadius.circular(AppValues.fullRadius)),
                  child: Image.network(model.avatar!, fit: BoxFit.fill),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${model.firstName.toString()}  ${model.lastName.toString()}",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "${model.email}",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      );
}

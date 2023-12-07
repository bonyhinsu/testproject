import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

import '../infrastructure/navigation/routes.dart';
import 'app_string.dart';

class CommonUtils {
  static final logger = Logger();
  static bool isLogoutInProcess = false;

  /// Method for hide and show App loader.
  static void hideShowLoadingIndicator(
      {required BuildContext context, required bool isShow}) {
    isShow ? context.loaderOverlay.show() : context.loaderOverlay.hide();
  }

  /// Method for show error message when something wrong.
  static void showErrorSnackBar(
      {String title = "", required String message, int seconds = 5}) {
    BuildContext? context = Get.context;
    Flushbar(
      title: title.isNotEmpty ? title : null,
      message: message,
      isDismissible: true,
      backgroundColor: Colors.red,
      messageColor: Colors.white,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: seconds),
    ).show(context!);
  }

  /// Method for show message when there is no internet.
  static void showNetworkError() {
    BuildContext? context = Get.context;
    Flushbar(
      title: AppString.noInternet,
      message: AppString.noInternetMessage,
      isDismissible: true,
      backgroundColor: Colors.blue,
      messageColor: Colors.white,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 5),
    ).show(context!);
  }

  /// Method for show information message to user.
  static void showInfoSnackBar(
      {String title = "",
      required String message,
      Duration duration = const Duration(seconds: 5)}) {
    BuildContext? context = Get.context;
    Flushbar(
      title: title.isNotEmpty ? title : null,
      message: message,
      isDismissible: true,
      backgroundColor: Colors.orangeAccent,
      messageColor: Colors.white,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarPosition: FlushbarPosition.TOP,
      duration: duration,
    ).show(context!);
  }

  /// Method for show information message to user.
  static void showProgressSnackBar(
      {String title = "",
      required String message,
      required AnimationController progressIndicatorController}) {
    BuildContext? context = Get.context;
    Flushbar(
      title: title.isNotEmpty ? title : null,
      message: message,
      isDismissible: true,
      backgroundColor: Colors.black,
      messageColor: Colors.white,
      progressIndicatorBackgroundColor: Colors.white,
      showProgressIndicator: true,
      progressIndicatorController: progressIndicatorController,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 5),
    ).show(context!);
  }

  /// Method for show success message to user.
  static void showSuccessSnackBar(
      {String title = "", required String message, int duration = 5}) {
    BuildContext? context = Get.context;
    Flushbar(
      title: title.isNotEmpty ? title : null,
      message: message,
      isDismissible: true,
      backgroundColor: Colors.green,
      messageColor: Colors.white,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: duration),
    ).show(context!);
  }

  /// Return flushbar for no internet message.
  static Flushbar getNoInternetFlushbar(
      {required String title, required String message, int delaySeconds = 5}) {
    return Flushbar(
      message: message,
      icon: const Icon(
        Icons.wifi_off,
        color: Colors.white,
      ),
      isDismissible: false,
      backgroundColor: Colors.black,
      messageColor: Colors.white,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarPosition: FlushbarPosition.TOP,
      shouldIconPulse: true,
      blockBackgroundInteraction: false,
    );
  }

  ///Shows message when there is any connection issue.
  static void showConnectionError() {
    CommonUtils.showErrorSnackBar(title: "", message: AppString.serverError);
  }

  ///Shows message when server is unreachable (response returns between 500 to 509).
  static void showServerDownError() {
    CommonUtils.showErrorSnackBar(
        title: "", message: AppString.connectionError);
  }

  ///Shows message when api not found (response returns 404).
  static void showApiNotFoundError() {
    CommonUtils.showErrorSnackBar(title: "", message: AppString.pageNotFound);
  }

  static void updateLoading(bool isLoading) {
    CommonUtils.hideShowLoadingIndicator(
        context: Get.context!, isShow: isLoading);
  }

  ///Open phone application in user's device with [phone]
  static void openPhoneApplication(String phone) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phone,
    );

    if (await urlLauncher.canLaunchUrl(launchUri)) {
      await urlLauncher.launchUrl(launchUri);
    } else {
      showErrorSnackBar(message: 'Could not open phone');
    }
  }

  ///Open message application in user's device with [phone]
  static void openMessageApplication(String phone) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: phone,
    );

    if (await urlLauncher.canLaunchUrl(launchUri)) {
      await urlLauncher.launchUrl(launchUri);
    } else {
      showErrorSnackBar(message: 'Could not open message app');
    }
  }

  ///Open email application in user's device with [toEmail]
  static void openEmailApplication(String toEmail) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: toEmail,
    );

    if (await urlLauncher.canLaunchUrl(launchUri)) {
      await urlLauncher.launchUrl(launchUri);
    } else {
      showErrorSnackBar(message: 'Could not email application');
    }
  }

  /// Open website link to specific browser.
  static void openLinkInBrowser(String websiteUrl) async {
    final Uri launchUri = Uri.parse(Uri.encodeFull(websiteUrl));

    if (await urlLauncher.canLaunchUrl(launchUri)) {
      await urlLauncher.launchUrl(launchUri);
    } else {
      showErrorSnackBar(message: 'Unable to launch browser!');
    }
  }

  /// Return string with formatted date from time
  static String getFormattedDate(String date) {
    if (date.isNotEmpty) {
      DateTime now = DateTime.parse(date);
      String dayFormatted = DateFormat('dd').format(now);
      String strDay = 'th';
      if (dayFormatted == "01") {
        strDay = "${dayFormatted}st";
      } else if (dayFormatted == "02") {
        strDay = "${dayFormatted}nd";
      } else if (dayFormatted == "03") {
        strDay = "${dayFormatted}rd";
      } else {
        strDay = "${dayFormatted}th";
      }
      final formattedDate = DateFormat('MMM yyyy').format(now);
      return "${strDay.replaceAll(RegExp(r'^0+(?=.)'), '')}, $formattedDate";
    } else {
      return "";
    }
  }

  /// Return string with formatted date from time
  static String ddmmmyyyyDate(String date) {
    if (date.isNotEmpty) {
      var currentTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date, true);
      return DateFormat('dd/MM/yyyy').format(currentTime);
    } else {
      return "";
    }
  }

  /// Return string with formatted date from time
  static String hhmmaDate(String date) {
    var currentTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date, true);
    if (date.isNotEmpty) {
      return DateFormat('hh:mm: aa').format(currentTime);
    } else {
      return "";
    }
  }

  /// Return string with formatted date from time
  static String yyyymmddDate(String date) {
    var currentTime = DateFormat("dd/MM/yyyy").parse(date, true);
    if (date.isNotEmpty) {
      return DateFormat('yyyy-MM-dd HH:mm:ss').format(currentTime);
    } else {
      return "";
    }
  }

  /// Convert timestamp to HH:mm aa time.
  static String convertToUserReadableTime(String date) {
    var currentTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date, true);
    if (date.isNotEmpty) {
      return DateFormat('HH:mm aa').format(currentTime);
    } else {
      return "";
    }
  }

  /// Convert timestamp to HH:mm aa time.
  static String convertDateAndTimeToTimestamp(String date, String time) {
    var currentTime =
        DateFormat("dd/MM/yyyy-HH:mm aa").parse("$date-$time", true);
    if (date.isNotEmpty) {
      return DateFormat('yyyy-MM-dd HH:mm:ss').format(currentTime);
    } else {
      return "";
    }
  }

  /// Convert timestamp to dd/MM/yyyy date.
  static String convertToUserReadableDate(String date) {
    var currentTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date, true);
    if (date.isNotEmpty) {
      return DateFormat('dd/MM/yyyy').format(currentTime);
    } else {
      return "";
    }
  }

  /// Return formated string from date and time filter
  static String getDateDifferenceFromNow(String date) {
    var currentTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date, true);
    Duration diff = DateTime.now().difference(currentTime);
    if (diff.inDays > 0) {
      return diff.inDays < 30
          ? "${diff.inDays} days ago"
          : getFormattedDate(date);
    }

    if (diff.inHours > 0) {
      return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
    }
    return "Just now";
  }

  /// Returns remaining days from today [date].
  static int getRemainingDays(String date) {
    var tillTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date, true);
    final currentTime = DateTime.now();
    return tillTime.difference(currentTime).inDays;
  }

  /// Returns remaining days from today [date].
  static String getRemainingDaysInWord(String date) {
    if (date.isEmpty) {
      return '';
    }
    final remainingDays = Jiffy.parse(date).fromNow();
    return remainingDays.replaceAll('a ', '1 ');
  }

  ///Convert number to words
  static String numberToWordsWithZero(num, {bool isFromSlider = false}) {
    RegExp regex = RegExp(r'([.])(?!.*\d)');
    if (num > 999 && num < 99999) {
      return "${((num / 1000).toStringAsFixed(1)).replaceAll(regex, '')}K";
    } else if (num > 99999 && num < 999999) {
      return "${((num / 1000).toStringAsFixed(1)).replaceAll(regex, '')}K";
    } else if (num > 999999 && num < 999999999) {
      return "${((num / 1000000).toStringAsFixed(1)).replaceAll(regex, '')}M";
    } else if (num > 999999999) {
      return "${((num / 1000000000).toStringAsFixed(1)).replaceAll(regex, '')}B";
    } else {
      return num.toString().replaceAll(regex, '');
    }
  }

  // /// Share post to other applications.
  // static void sharePostToOtherApps(PostModel postModel) async {
  //   String text = '${postModel.postDescription} \n\n ${postModel.postImage}';
  //   await Share.share(
  //     text,
  //     subject: postModel.clubName,
  //   );
  // }

  static String getUserPassword() => 'User@123';

  static String getDateFromTimeStamp(int messageTime) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(messageTime);
    final _dayDifference = calculateDifference(dateTime);
    if (_dayDifference == 0) {
      return "Today";
    }
    if (_dayDifference == -1) {
      return "Yesterday";
    }
    // if (_dayDifference < -1) {
    //   return DateFormat('dd/MM/yy').format(dateTime);
    // }
    return getRemainingDaysInWord(dateTime.toString());
  }

  /// Returns the difference (in full days) between the provided date and today.
  static int calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }
}

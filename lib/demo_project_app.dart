import 'package:demoproject/values/app_colors.dart';
import 'package:demoproject/values/app_font_size.dart';
import 'package:demoproject/values/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'values/app_text_theme.dart';

class DemoProjectApplication extends StatefulWidget {
  const DemoProjectApplication({Key? key}) : super(key: key);

  @override
  State<DemoProjectApplication> createState() => _DemoProjectApplicationState();
}

class _DemoProjectApplicationState extends State<DemoProjectApplication> {
  @override
  Widget build(BuildContext context) {
    const spinkit = SpinKitFadingCircle(
      duration: Duration(milliseconds: 400),
      size: 40,
      color: Colors.white,
    );

    final lottieAnimation = Lottie.asset(
      'assets/lottie_json/loading_ball.json',
      width: 100,
      height: 100,
      delegates: LottieDelegates(
        values: [
          ValueDelegate.color(
            const ['Shape Layer 1', 'Rectangle', 'Fill 1'],
            value: Colors.white,
          ),
        ],
      ),
    );

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppColors.pageBackground));

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            constraints: (GetPlatform.isWeb || GetPlatform.isDesktop)
                ? const BoxConstraints(minWidth: 500, maxWidth: 550)
                : const BoxConstraints.tightForFinite(),
            child: GlobalLoaderOverlay(
              overlayOpacity: 0.5,
              overlayColor: Colors.white,
              useDefaultLoading: false,
              overlayWholeScreen: true,
              overlayWidget: Center(
                child: lottieAnimation,
              ),
              child: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.dark,
                child: GetMaterialApp(
                  title: AppString.appTitle,
                  debugShowCheckedModeBanner: false,
                  enableLog: true,
                  initialRoute: Routes.initialRoute,
                  getPages: Nav.routes,
                  themeMode: ThemeMode.light,
                  builder: (context, child) {
                    final mediaQueryData = MediaQuery.of(context);
                    final constrainedTextScaleFactor =
                        mediaQueryData.textScaleFactor.clamp(0.0, 1.0);

                    return MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                            textScaleFactor: constrainedTextScaleFactor),
                        child: child!);
                  },
                  theme: ThemeData(
                    scaffoldBackgroundColor: AppColors.pageBackground,
                    primarySwatch: AppColors.colorPrimarySwatch,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    bottomSheetTheme: const BottomSheetThemeData(
                        backgroundColor: AppColors.pageBackground,
                        clipBehavior: Clip.hardEdge),
                    brightness: Brightness.dark,
                    primaryColor: AppColors.colorPrimary,
                    textTheme: textThemeLight(),
                    fontFamily: FontConstants.poppins,
                  ),
                  home: AnnotatedRegion<SystemUiOverlayStyle>(
                    value: SystemUiOverlayStyle.dark
                        .copyWith(statusBarColor: AppColors.pageBackground),
                    child: SafeArea(
                      child: Container(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*C:\Users\DELL\flutter\bin*/
/*C:\Users\DELL\flutter\bin\cache\dart-sdk\bin*/

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/splash.controller.dart';

class SplashScreen extends GetView<SplashController> {
  SplashScreen({Key? key}) : super(key: key);
  final SplashController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Test Demo", style: TextStyle(fontSize: 20)),
            SizedBox(
              height: 10,
            ),
            Text("Loading...")
          ],
        ),
      ),
    );
  }
}

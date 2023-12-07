import 'package:flutter/material.dart';

import 'config/environment.dart';
import 'demo_project_app.dart';

void main() async {
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.development,
  );

  Environment().initConfig(environment);

  // HttpOverrides.global = MyHttpOverrides();
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const DemoProjectApplication());
}

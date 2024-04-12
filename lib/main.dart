import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/pages.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); //TODO: Change orientations befor runApp
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const StartPage());
}

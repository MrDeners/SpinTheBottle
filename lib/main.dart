import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/Pages.dart';

void main() {
  runApp(StartPage());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

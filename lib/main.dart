import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/Pages.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => StartPage(),
      // '/PlayField': (context) => const PlayFieldPage(),
      // '/Profile': (context) => const UserProfilePage(),
      // '/Settings': (context) => const SettingsPage(),
    },
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

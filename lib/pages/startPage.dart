import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(SpinTheBottle());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

class SpinTheBottle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Spin the Bottle",
      theme: ThemeData(
        primaryColor: const Color(0xFF160531),
        scaffoldBackgroundColor: const Color(0xFF160531),
        decoration: BoxDecoration()
        //textTheme: TextTheme(title: TextStyle(color: Color(0xFFEDEDED))),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      body: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/MainPageBackground.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
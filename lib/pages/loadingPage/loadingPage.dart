import 'package:flutter/material.dart';
import 'dart:async';
import 'package:spin_the_bottle/classes/userData.dart';
import 'package:spin_the_bottle/translations/translations.dart';
import 'package:spin_the_bottle/pages/pages.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: "Rounds",
            fontSize: 70,
            color: Color(0xFFEDEDED),
            height: 0.1,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(3, 3),
                blurRadius: 15,
              ),
            ],
          ),
        )),
        home: Scaffold(
          body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/LoadingPageBackground.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Bottle(),
                      Text("ЗАГРУЗКА",
                          style: Theme.of(context).textTheme.bodyLarge),
                      const Dots(),
                    ],
                  ),
                ),
              )),
        ));
  }
}

class Bottle extends StatefulWidget {
  const Bottle({super.key});

  @override
  State<Bottle> createState() => _BottleState();
}

class _BottleState extends State<Bottle> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(); // повторять анимацию постоянно
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.asset('assets/BigBottle.png'),
    );
  }
}

class Dots extends StatefulWidget {
  const Dots({super.key});

  @override
  State<Dots> createState() => _DotsState();
}

class _DotsState extends State<Dots> {
  List<String> dots = [".", "..", "..."];
  int currentIndex = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % dots.length;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(dots[currentIndex],
        style: Theme.of(context).textTheme.bodyLarge);
  }
}

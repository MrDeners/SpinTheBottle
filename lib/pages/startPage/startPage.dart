// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:spin_the_bottle/classes/globalVariables.dart';

import 'package:spin_the_bottle/classes/user.dart';
import 'package:spin_the_bottle/translations/translations.dart';
import 'package:spin_the_bottle/pages/pages.dart';
import 'package:spin_the_bottle/widgets/widgets.dart';
import 'package:spin_the_bottle/pages/startPage/functions.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final User user = GlobalVariables.user;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
                fontFamily: "Rounds", fontSize: 40, color: Color(0xFFEDEDED)),
            bodyMedium: TextStyle(
                fontFamily: "Rounds", fontSize: 25, color: Color(0xFFEDEDED)),
          )),
      home: Scaffold(
          body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/MainPageBackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 35,
              child: SafeArea(
                child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: MenuTop(
                      user: user,
                    )),
              ),
            ),
            Expanded(flex: 65, child: Menu(user: user))
          ],
        ),
      )),
    );
  }
}

class MenuTop extends StatefulWidget {
  final User user;
  const MenuTop({super.key, required this.user});

  @override
  State<MenuTop> createState() => _MenuTopState();
}

class _MenuTopState extends State<MenuTop> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 24,
          child: Container(
            alignment: Alignment.topLeft,
            child: HeartsCounter(heartsAmount: widget.user.heartsAmount),
          ),
        ),
        Expanded(
            flex: 52,
            child: Container(
                alignment: Alignment.bottomLeft,
                child: const Image(image: AssetImage('assets/Logo.png')))),
        const Spacer(flex: 24),
      ],
    );
  }
}

class Menu extends StatelessWidget {
  final User user;
  const Menu({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/MenuBackground.png'),
                    fit: BoxFit.cover)),
            child: SafeArea(
              child: Row(
                children: [
                  const Expanded(
                    flex: 20,
                    child: ImageButton(
                        imagePath: 'assets/MostPopularDonateButton.png',
                        onPressed: letMostPopularDonate),
                  ),
                  const Spacer(flex: 7),
                  Expanded(
                    flex: 42,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MainButton(
                          label: 'ИГРАТЬ',
                          onClick: () {
                            Navigator.pushReplacement(
                                context,
                                DownUpTranslation(
                                  exitPage: this,
                                  enterPage: const LoadingPage(),
                                ));
                          },
                        ),
                        MainButton(label: 'ПРОФИЛЬ', onClick: () {}),
                        MainButton(label: 'НАСТРОЙКИ', onClick: () {}),
                      ],
                    ),
                  ),
                  const Spacer(flex: 5),
                  Expanded(
                    flex: 24,
                    child: ImageButton(
                        imagePath: 'assets/BPButton.png',
                        onPressed: () {}), //TODO: Move to BP Page
                  )
                ],
              ),
            )));
  }
}

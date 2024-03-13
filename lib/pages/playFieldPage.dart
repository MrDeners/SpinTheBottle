import 'package:flutter/material.dart';

import 'package:spin_the_bottle/classes/user.dart';
import 'package:spin_the_bottle/classes/globalVariables.dart';
import 'package:spin_the_bottle/pages/pages.dart';
import 'package:spin_the_bottle/translations/translations.dart';
import 'package:spin_the_bottle/widgets/widgets.dart';

class PlayFieldPage extends StatelessWidget {
  PlayFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = GlobalVariables.user;
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
                fontFamily: "Rounds", fontSize: 40, color: Color(0xFFEDEDED)),
            bodySmall: TextStyle(
                fontFamily: "Rounds", fontSize: 25, color: Color(0xFFEDEDED)),
          )),
      home: Scaffold(
          body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/PlayFieldBackground.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(children: [
                Expanded(flex: 680, child: Table(user: user)),
                const Spacer(flex: 5),
                const Expanded(flex: 315, child: Chat())
              ]))),
    );
  }
}

class Table extends StatelessWidget {
  final User user;
  const Table({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/TableSkins/MainTableSkin.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
          right: false,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: ImageButton(
                          imagePath: 'assets/ReturnButton.png',
                          onPressed: () {})),
                  Expanded(
                      child: HeartsCounter(
                    heartsAmount: user.heartsAmount,
                  )),
                  Spacer(),
                  Expanded(
                      child: ImageButton(
                          imagePath: 'assets/RewardsButton.png',
                          onPressed: () {})),
                  Expanded(
                      child: ImageButton(
                          imagePath: 'assets/GiftsButton.png',
                          onPressed: () {})),
                ],
              )
            ],
          )),
    );
  }
}

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/ChatBackground.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(left: false, child: Text("Hello")),
    );
  }
}

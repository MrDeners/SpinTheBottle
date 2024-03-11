import 'package:flutter/material.dart';
import 'package:spin_the_bottle/classes/userData.dart';
import 'package:spin_the_bottle/translation/translations.dart';

class PlayFieldPage extends StatelessWidget {
  final UserData user = const UserData(
      firstName: 'Denis',
      secondName: 'Malush',
      heartsAmount: 777777,
      age: "18");

  const PlayFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: const Row(children: [
                Expanded(flex: 680, child: Table()),
                Spacer(flex: 5),
                Expanded(flex: 315, child: Chat())
              ]))),
    );
  }
}

class Table extends StatelessWidget {
  const Table({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/TableSkins/MainSkin.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(child: Text("Hello")),
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
      child: SafeArea(child: Text("Hello")),
    );
    ;
  }
}

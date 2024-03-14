// ignore_for_file: file_names
import 'package:flutter/material.dart';

import 'package:spin_the_bottle/pages/playFieldPage/functions.dart';
import 'package:spin_the_bottle/classes/table.dart';
import 'package:spin_the_bottle/classes/user.dart';
import 'package:spin_the_bottle/classes/globalVariables.dart';
import 'package:spin_the_bottle/pages/pages.dart';
import 'package:spin_the_bottle/translations/translations.dart';
import 'package:spin_the_bottle/widgets/widgets.dart';

class PlayFieldPage extends StatelessWidget {
  const PlayFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = GlobalVariables.user;
    PlayTable table = PlayTable(
      ID: 255355,
    );

    table.addUser(user); //TODO: Move to Server

    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
              bodyLarge: TextStyle(
                fontFamily: "Rounds",
                fontSize: 40,
                color: Color(0xFFEDEDED),
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(3, 3),
                    blurRadius: 15,
                  ),
                ],
              ),
              bodySmall: TextStyle(
                fontFamily: "Rounds",
                fontSize: 10,
                color: Color(0xFFEDEDED),
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(1, 2),
                    blurRadius: 3,
                  ),
                ],
              ),
              bodyMedium: TextStyle(
                fontFamily: "Rounds",
                fontSize: 25,
                color: Color(0xFFEDEDED),
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(1, 2),
                    blurRadius: 3,
                  ),
                ],
              ),
              labelSmall: TextStyle(
                fontFamily: "Inter",
                fontSize: 8,
                color: Color(0xFFFFFFFF),
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(0, 0),
                    blurRadius: 5,
                  ),
                ],
              ))),
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
                Expanded(flex: 680, child: PlayField(table: table)),
                const Spacer(flex: 5),
                const Expanded(flex: 315, child: Chat())
              ]))),
    );
  }
}

class PlayField extends StatefulWidget {
  final PlayTable table;
  const PlayField({super.key, required this.table});

  @override
  State<PlayField> createState() => _PlayFieldState();
}

class _PlayFieldState extends State<PlayField> {
  @override
  Widget build(BuildContext context) {
    PlayTable table = widget.table;

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
          child: Stack(
            children: [
              TableButtons(table: table),
              TableBottle(
                table: table,
              ),
              const TablePlayers(),
            ],
          )),
    );
  }
}

class TableButtons extends StatefulWidget {
  final PlayTable table;
  const TableButtons({super.key, required this.table});

  @override
  State<TableButtons> createState() => _TableButtonsState();
}

class _TableButtonsState extends State<TableButtons> {
  @override
  Widget build(BuildContext context) {
    PlayTable table = widget.table;
    final User user = GlobalVariables.user;

    return Column(
      children: [
        Expanded(
          flex: 20,
          child: Row(
            children: [
              Expanded(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: ImageButton(
                        imagePath: 'assets/ReturnButton.png',
                        onPressed: () {
                          //TODO: Create server request to leave
                          Navigator.pushReplacement(
                              context,
                              UpDownTranslation(
                                exitPage: const PlayFieldPage(),
                                enterPage: const StartPage(),
                              ));
                        }),
                  )),
              Expanded(
                  flex: 15,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: HeartsCounter(
                      heartsAmount: user.heartsAmount,
                    ),
                  )),
              const Spacer(
                flex: 10,
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.topRight,
                    child: ImageButton(
                        imagePath: 'assets/ProfileButton.png',
                        onPressed: () {}),
                  )),
              Expanded(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: ImageButton(
                        imagePath: 'assets/GiftsButton.png', onPressed: () {}),
                  )),
            ],
          ),
        ),
        const Spacer(flex: 100),
        Expanded(
          flex: 20,
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    textAlign: TextAlign.center,
                    "Столик \n ${table.ID}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              Expanded(
                  flex: 7,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: ImageButton(
                      imagePath: 'assets/ChangeTableButton.png',
                      onPressed: () {}, //TODO: Change table
                    ),
                  )),
              const Spacer(flex: 50),
            ],
          ),
        )
      ],
    );
  }
}

class TableBottle extends StatefulWidget {
  final PlayTable table;
  const TableBottle({super.key, required this.table});

  @override
  State<TableBottle> createState() => _TableBottleState();
}

class _TableBottleState extends State<TableBottle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late PlayTable table;

  @override
  void initState() {
    super.initState();
    table = widget.table;
    _controller = AnimationController(
      duration: const Duration(seconds: 9),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 9,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PlayTable table = widget.table;

    return Center(
      child: RotationTransition(
        turns: _animation,
        child: ImageButton(
          imagePath: table.bottleSkinImage,
          onPressed: () {
            if (_controller.status == AnimationStatus.completed ||
                _controller.status == AnimationStatus.dismissed) {
              _controller.reset();
            }
            setState(() {
              _animation = Tween<double>(
                begin: 0.0,
                end: 9 +
                    getRandomPosition(table.userIntervals[GlobalVariables
                        .user.chair
                        .toString()]), //TODO: GlobalVariables.user.chair => table.selectedUsers[1].chair
              ).animate(
                  CurvedAnimation(parent: _controller, curve: Curves.easeOut));
            });
            _controller.forward();
          },
        ),
      ),
    );
  }
}

class TablePlayers extends StatefulWidget {
  const TablePlayers({super.key});

  @override
  State<TablePlayers> createState() => _TablePlayersState();
}

class _TablePlayersState extends State<TablePlayers> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height / 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Transform.translate(
                  offset: Offset(0, MediaQuery.of(context).size.height / 20),
                  child: const Player(),
                ),
                Transform.translate(
                    offset: Offset(0, -MediaQuery.of(context).size.height / 20),
                    child: const Player()),
                Transform.translate(
                  offset: Offset(0, MediaQuery.of(context).size.height / 20),
                  child: const Player(),
                ),
              ],
            ),
          ),
        ),
        const Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Player(),
              Player(),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height / 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Transform.translate(
                  offset: Offset(0, -MediaQuery.of(context).size.height / 20),
                  child: const Player(),
                ),
                Transform.translate(
                    offset: Offset(0, MediaQuery.of(context).size.height / 50),
                    child: const Player()),
                Transform.translate(
                  offset: Offset(0, -MediaQuery.of(context).size.height / 20),
                  child: const Player(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  final User user = GlobalVariables.user; //TODO: Update to user from Table
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 8,
            child: Container(
                alignment: Alignment.bottomCenter,
                child: Align(
                  child: Stack(
                    children: [
                      Transform.translate(
                          offset: const Offset(2.5, 2.5),
                          child: ImageButton(
                              imagePath: user.avatar, onPressed: () {})),
                      ImageButton(
                          imagePath: user.border,
                          onPressed: () {}), //TODO: Open profile
                    ],
                  ),
                ))),
        Expanded(
          flex: 2,
          child: Container(
            alignment: const Alignment(0, -2),
            child: Text(
              "${user.firstName} ${user.secondName}, ${user.age}",
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
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
      child: SafeArea(
        left: false,
        child: Text("Hello", style: Theme.of(context).textTheme.bodySmall),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spin_the_bottle/classes/userData.dart';
import 'package:spin_the_bottle/translation/translations.dart';
import 'package:spin_the_bottle/pages/pages.dart';

class StartPage extends StatelessWidget {
  final UserData user = const UserData(
      firstName: 'Denis',
      secondName: 'Malush',
      heartsAmount: 777777,
      age: "18");

  const StartPage({super.key});

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
            const Expanded(flex: 65, child: Menu())
          ],
        ),
      )),
    );
  }
}

class MenuTop extends StatelessWidget {
  final UserData user;
  MenuTop({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 24,
          child: Container(
            alignment: Alignment.topLeft,
            child: HeartsCounter(user: user),
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

class HeartsCounter extends StatefulWidget {
  final UserData user;
  const HeartsCounter({super.key, required this.user});

  @override
  State<HeartsCounter> createState() => _HeartsCounterState();
}

class _HeartsCounterState extends State<HeartsCounter> {
  late UserData user;
  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: Text(
        user.heartsAmount.toString(),
        style: Theme.of(context).textTheme.bodySmall,
      ),
      icon: Image.asset('assets/HeartsCounterIcon.png'),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(null)),
      onPressed: () {
        //TODO: Move to donate page
      },
    );
  }
}

class MainButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onClick;
  final double fontSize;
  final double paddingBottom;
  const MainButton(
      {super.key,
      required this.label,
      required this.onClick,
      this.fontSize = 40,
      this.color = const Color(0xFFBE0279),
      this.paddingBottom = 0});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Column(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(color)),
              onPressed: onClick,
              child: Text(
                label,
                style: TextStyle(
                    fontFamily: "Rounds",
                    fontSize: fontSize,
                    color: const Color(0xFFEDEDED)),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: paddingBottom))
          ],
        ));
  }
}

class ImageButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  const ImageButton(
      {super.key, required this.imagePath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(imagePath),
      onPressed: onPressed,
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key});

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
                        onPressed: GetMostPopularDonate),
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
                            Navigator.push(
                                context,
                                EnterExitRoute(
                                    exitPage: this,
                                    enterPage: PlayFieldPage()));
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

void GetMostPopularDonate() {
  //TODO: Create best donate buying function
}

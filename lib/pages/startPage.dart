import 'package:flutter/material.dart';
import 'package:spin_the_bottle/classes/userData.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartPage extends StatelessWidget {
  final UserData user = UserData('firstName', 'secondName', 777);

  StartPage({super.key});

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
              child: HeartsCounter(user: user)),
        ));
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

//const AssetImage('assets/Logo.png');    //* Logo

class MainButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onClick;
  const MainButton(
      {super.key,
      required this.label,
      required this.onClick,
      this.color = const Color(0xFFBE0279)});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
          onPressed: onClick,
          child: Text(label),
        ));
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
    ));
  }
}

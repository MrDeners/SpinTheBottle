// ignore_for_file: file_names

import 'package:flutter/material.dart';

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

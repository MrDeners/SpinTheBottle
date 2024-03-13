import 'package:flutter/material.dart';

class HeartsCounter extends StatefulWidget {
  final int heartsAmount;
  const HeartsCounter({super.key, required this.heartsAmount});

  @override
  State<HeartsCounter> createState() => _HeartsCounterState();
}

class _HeartsCounterState extends State<HeartsCounter> {
  late int heartsAmount;
  @override
  void initState() {
    super.initState();
    heartsAmount = widget.heartsAmount;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: Text(
        heartsAmount.toString(),
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

// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      icon: SvgPicture.asset('assets/HeartsCounterIcon.svg'),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(null)),
      onPressed: () {
        //TODO: Move to donate page
      },
    );
  }
}

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageButtonSVG extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  const ImageButtonSVG(
      {super.key, required this.imagePath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(imagePath),
      onPressed: onPressed,
    );
  }
}

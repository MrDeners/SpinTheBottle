// ignore_for_file: file_names

import 'package:flutter/material.dart';

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

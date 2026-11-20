import 'package:flutter/material.dart';


class SectionHeading extends StatelessWidget {
  final String text;
  final double? fontSize;
  const SectionHeading({
    super.key, required this.text, this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white70,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
import 'package:flutter/material.dart';

class TitleComponent extends StatelessWidget {
  const TitleComponent({ super.key, required this.title });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
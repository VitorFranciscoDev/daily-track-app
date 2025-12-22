import 'package:flutter/material.dart';

class SubtitleComponent extends StatelessWidget {
  const SubtitleComponent({ super.key, required this.subtitle });
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey,
      ),
    );
  }
}
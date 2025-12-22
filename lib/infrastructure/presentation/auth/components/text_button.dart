import 'package:flutter/material.dart';

class TextButtonComponent extends StatelessWidget {
  const TextButtonComponent({ super.key, required this.message, required this.function });
  final String message;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => function(), 
      child: Text(
        message,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
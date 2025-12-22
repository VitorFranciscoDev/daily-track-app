import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({ super.key, required this.message, required this.function });
  final String message;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => function(),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: Size(double.infinity, 50),
        backgroundColor: Colors.red,
      ),
      child: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
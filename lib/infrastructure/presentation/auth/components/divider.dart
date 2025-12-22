import 'package:flutter/material.dart';

class DividerComponent extends StatelessWidget {
  const DividerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey[300])),
        const SizedBox(width: 15),
        const Text("or", style: TextStyle(color: Colors.grey)),
        const SizedBox(width: 15),
        Expanded(child: Divider(color: Colors.grey[300])),
      ],
    );
  }
}
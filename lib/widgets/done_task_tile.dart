import 'package:flutter/material.dart';

class DoneTaskTile extends StatelessWidget {
  const DoneTaskTile({super.key, required this.tileTitle});
  final String tileTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.restore,
        size: 24.0,
      ),
      title: Text(
        tileTitle,
        style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.lineThrough,
              decorationStyle: TextDecorationStyle.solid,
              
        ),
      ),
    );
  }
}

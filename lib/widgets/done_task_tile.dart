// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DoneTaskTile extends StatelessWidget {
  const DoneTaskTile({
    Key? key,
    required this.tileTitle,
    required this.restore,
  }) : super(key: key);
  final String tileTitle;
  final void Function() restore;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
      onPressed: restore,
      icon: const Icon(
      Icons.restore,
      size: 24.0,
      ),
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

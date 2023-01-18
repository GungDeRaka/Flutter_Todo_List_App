// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ToDOListTile extends StatelessWidget {
  const ToDOListTile({
    Key? key,
    required this.titleText,
  }) : super(key: key);
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: Border.all(color: Colors.white, width: 1.4),
      style: ListTileStyle.list,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      leading: Icon(Icons.check_box_outline_blank_rounded),
      title: Text(
        titleText,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w800,
        ),
      ),
      trailing: Icon(Icons.star_outline),
    );
  }
}

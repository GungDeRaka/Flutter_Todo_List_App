// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


class ToDoListTile extends StatelessWidget {
  const ToDoListTile({
    Key? key,
    required this.titleText,
    required this.value,
    this.onChanged,
    
  }) : super(key: key);

  final String titleText;
  final bool value;
  final ValueChanged<bool?>? onChanged;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        shape: Border.all(color: Theme.of(context).indicatorColor, width: 1.4),
        style: ListTileStyle.list,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        leading: Checkbox(value: value, onChanged: onChanged),
        title: Text(
          titleText,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            decorationStyle: TextDecorationStyle.solid,
          ),
        ),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}

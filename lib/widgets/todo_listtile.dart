// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/todo_controller.dart';

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
  // final TextDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        shape: Border.all(color: Colors.white, width: 1.4),
        style: ListTileStyle.list,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        leading: Checkbox(value: value, onChanged:onChanged),
        title: Text(
          titleText,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            //decoration: decoration,
          ),
        ),
        trailing: Icon(Icons.star_outline),
      ),
    );
  }
}

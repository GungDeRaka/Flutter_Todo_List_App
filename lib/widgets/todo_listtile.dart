// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/todo_controller.dart';
import 'checked_icon.dart';

class ToDoListTile extends StatelessWidget {
  const ToDoListTile(this.widgetIndex, {
    Key? key,
    required this.titleText,
    required this.leadIcon,
  }) : super(key: key);

  final String titleText;
  final IconData leadIcon;
  final int widgetIndex;
  

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoController>(
      builder: (context, value, child) => Padding(padding: const EdgeInsets.symmetric(vertical: 4),
        child: ListTile(
        shape: Border.all(color: Colors.white, width: 1.4),
        style: ListTileStyle.list,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        leading: IconButton(
          
          onPressed: () {value.checked(widgetIndex);},
          icon: Icon(
            leadIcon,
            size: 24.0,
          ),
        ),
        title: Text(titleText,
        style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        decoration: value.isChecked ? TextDecoration.lineThrough : TextDecoration.none
        ),
        ),
        trailing: Icon(Icons.star_outline),
          ),
      ),);
  }
}

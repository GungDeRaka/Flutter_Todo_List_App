import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/widgets/todo_listtile.dart';

import '../controller/todo_controller.dart';

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoController>(
      builder: (context, toDo, child) => ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            itemCount: toDo.taskList.length,
            itemBuilder: ((context, index) {
              var task = toDo.taskList.getAt(index);
              return Hero(
                tag: "ceking",
                child: ToDoListTile(
                    value: task.isDone!,
                    onChanged: (value) {
                      toDo
                          .checked(index, value!)
                          .then((val) => toDo.afterChecked(index));
                    },
                    titleText: task.taskName!),
              );
            })),
    );
  }
}

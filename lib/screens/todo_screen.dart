import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/widgets/todo_listtile.dart';

import '../controller/todo_controller.dart';

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoController>(
      builder: (context, value, child) => Scaffold(
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          itemCount: context.watch<ToDoController>().taskList.length,
          itemBuilder: ((context, index) => Hero(
                tag: "checked",
                child: ToDoListTile(index,
                    leadIcon: value.isChecked
                        ? Icons.check_box_outlined
                        : Icons.check_box_outline_blank,
                    titleText: context.watch<ToDoController>().taskList[index]),
              )),
        ),
      ),
    );
  }
}

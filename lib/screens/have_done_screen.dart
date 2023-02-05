import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/controller/todo_controller.dart';
import 'package:todo_list_app/widgets/done_task_tile.dart';

class HaveDone extends StatelessWidget {
  const HaveDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoController>(
      builder: (context, toDo, child) => ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: toDo.doneTasks.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: DoneTaskTile(tileTitle: toDo.doneTasks[index].taskName! ,)
          );
        },
      ),
    );
  }
}

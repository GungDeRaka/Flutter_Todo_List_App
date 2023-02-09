import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_list_app/model/task_model.dart';

import '../widgets/my_bottom_sheet_widget.dart';

class ToDoController with ChangeNotifier {
  Box taskList = Hive.box("uncompletedTaskBox");
  Box doneTasks = Hive.box("completedTaskBox");

  static Future openTaskBox() async {
    await Hive.openBox("completedTaskBox");
    await Hive.openBox("uncompletedTaskBox");
  }

  TextEditingController textController = TextEditingController();

  Future<void> checked(int index, bool newValue) async {
    var task = taskList.getAt(index);
    task.isDone = newValue;
    task.isRetrieved = newValue;
    notifyListeners();
  }

  void afterChecked(int index) async {
    print("donetask= ${doneTasks.length}");
    print("taskList= ${taskList.length}");
    await Future.delayed(const Duration(milliseconds: 500));
    doneTasks.add(taskList.getAt(index));
    taskList.deleteAt(index);

    notifyListeners();
    print("donetask= ${doneTasks.length}");
    print("taskList= ${taskList.length}");
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: MyBottomSheetWidget(
            onSaved: () {
              saveTask();
              Navigator.pop(context);
            },
            onCanceled: () {
              textController.clear();
              Navigator.pop(context);
            },
          ),
        );
      },
    );
    notifyListeners();
  }

  void saveTask() {
    if (textController.text.isNotEmpty) {
      taskList.add(MyTask.uncomplete(
        taskName: textController.text,
        isDone: false,
        isRetrieved: true,
      ));
    }
    textController.clear();
    notifyListeners();
    print("donetask= ${doneTasks.length}");
    print("taskList= ${taskList.length}");
  }

  void restore(int index, String taskName) async {
    await Future.delayed(const Duration(milliseconds: 500));

    taskList.add(MyTask.uncomplete(
      taskName: taskName,
      isDone: false,
      isRetrieved: true,
    ));
    doneTasks.deleteAt(index);
    notifyListeners();
  }

  void clearDoneTasks() {
    doneTasks.clear();

    notifyListeners();
    print("donetask= ${doneTasks.length}");
    print("taskList= ${taskList.length}");
  }
}

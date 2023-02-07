import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_list_app/model/task_model.dart';
import 'package:todo_list_app/widgets/todo_listtile.dart';

import '../widgets/my_bottom_sheet_widget.dart';

class ToDoController with ChangeNotifier {
  // String uncompletedTaskBox = 'uncompletedTaskBox';
  // String completedTaskBox = 'completedTaskBox';
  Box taskList = Hive.box("uncompletedTaskBox");
  Box doneTasks = Hive.box("completedTaskBox");

  Future openTaskBox() async {
    var unTaskBox = await Hive.openBox("completedTaskBox");
    var taskBox = await Hive.openBox("uncompletedTaskBox");
  taskList;
  doneTasks;
    notifyListeners();
  }

  ///add the member of [taskList] from input user
  TextEditingController textController = TextEditingController();

  ///a special function, used for everytime the checkbox in [ToDoListTile] is clicked.
  ///[checked] need some argument like:
  ///
  ///[index] to update some value of [boolList] member.
  ///
  ///[newValue] for give a new value for each [boolList] index
  Future<void> checked(int index, bool newValue) async {
    var task = taskList.getAt(index);
    task.isDone = newValue;
    task.isRetrieved = newValue;
    notifyListeners();
  }

  void afterChecked(int index) async {
  
    await Future.delayed(const Duration(milliseconds: 500));
    doneTasks.add(taskList.getAt(index));
    taskList.deleteAt(index);
    // boolList.removeAt(index);
    notifyListeners();
  }

  ///A helper function to call [MyBottomSheetWidget]
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

  ///[saveTask] will add some member for [taskList], [boolList], and [decor]
  ///whenever this function is called
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
  }

  void clearDoneTasks() {
    doneTasks.clear();

    notifyListeners();
  }
}

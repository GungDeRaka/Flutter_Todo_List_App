import 'package:flutter/material.dart';
import 'package:todo_list_app/model/task_model.dart';
import 'package:todo_list_app/widgets/todo_listtile.dart';

import '../widgets/my_bottom_sheet_widget.dart';

class ToDoController with ChangeNotifier {
  ///a list of strings to dislay in [ToDo]
  List<MyTask> taskList = [];

  List<MyTask> doneTasks = [];

  ///add the member of [taskList] from input user
  TextEditingController textController = TextEditingController();

  ///a special funtion, used for everytime the checkbox in [ToDoListTile] is clicked.
  ///[checked] need some argument like:
  ///
  ///[index] to update some value of [boolList] member.
  ///
  ///[newValue] for give a new value for each [boolList] index
  Future<void> checked(int index, bool newValue) async {
    taskList[index].isDone = newValue;
    taskList[index].isRetrieved = newValue;
    notifyListeners();
  }

  void afterChecked(int index) async {
    await Future.delayed(const Duration(milliseconds: 500));
    doneTasks.add(taskList[index]);
    taskList.removeAt(index);
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

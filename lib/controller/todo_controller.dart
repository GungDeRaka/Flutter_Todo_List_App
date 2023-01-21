import 'package:flutter/material.dart';
import 'package:todo_list_app/widgets/todo_listtile.dart';

import '../widgets/my_bottom_sheet_widget.dart';

class ToDoController with ChangeNotifier {
  ///a list of strings to dislay in [ToDo]
  List<String> taskList = [];

  ///list bool for the value of checkbox in [ToDoListTile]
  List<bool> boolList = [];

  ///list of text decoration for decorate displayed string in [taskList] index
  List<TextDecoration> decor = [];

  ///add the member of [taskList] from input user
  TextEditingController textController = TextEditingController();

  ///a special funtion, used for everytime the checkbox in [ToDoListTile] is clicked.
  ///[checked] need some argument like:
  ///
  ///[index] to update some value of [boolList] member.
  ///
  ///[newValue] for give a new value for each [boolList] index
  void checked(int index, bool newValue) {
    boolList[index] = newValue;
    decor[index] =
        boolList[index] ? TextDecoration.lineThrough : TextDecoration.none;
    notifyListeners();
  }

  ///A helper function to call [MyBottomSheetWidget]
  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return MyBottomSheetWidget(
          onSaved: () {
            saveTask();
            Navigator.pop(context);
          },
          onCanceled: () {
            textController.clear();
            Navigator.pop(context);
          },
        );
      },
    );
    notifyListeners();
  }

  ///[saveTask] will add some member for [taskList], [boolList], and [decor]
  ///whenever this function is called
  void saveTask() {
    if (textController.text.isNotEmpty) {
      taskList.add(textController.text);
      boolList.add(false);
      decor.add(TextDecoration.none);
    }
    textController.clear();
    notifyListeners();
  }
}

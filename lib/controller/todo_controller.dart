import 'package:flutter/material.dart';
import 'package:todo_list_app/widgets/todo_listtile.dart';

import '../widgets/my_bottom_sheet_widget.dart';

class ToDoController with ChangeNotifier {
  List<String> taskList = [];
  List<bool> boolList = [];
  late TextDecoration decor;

  TextEditingController textController = TextEditingController();

  void checked(int index, bool newValue ) {
    boolList[index] = newValue;
    notifyListeners();
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return const MyBottomSheetWidget();
      },
    );
    notifyListeners();
  }

  void addTask() {
    if (textController.text.isNotEmpty) {
      taskList.add(textController.text);
      boolList.add(false);
    }
    notifyListeners();
  }
}

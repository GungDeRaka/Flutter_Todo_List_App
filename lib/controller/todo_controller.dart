import 'package:flutter/material.dart';
import 'package:todo_list_app/widgets/todo_listtile.dart';

import '../widgets/my_bottom_sheet_widget.dart';

class ToDoController with ChangeNotifier {
  List<String> taskList = [];
 
  int index = 0;
  TextEditingController textController = TextEditingController();
   
  bool isChecked = false;
  void checked(int selectedIndex) {
    // if (selectedIndex == index) {
      isChecked = !isChecked;
    //}
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
      index+=1;
    }
    notifyListeners();
  }
}

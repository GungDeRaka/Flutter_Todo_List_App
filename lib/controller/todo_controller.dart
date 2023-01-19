import 'package:flutter/material.dart';
import 'package:todo_list_app/widgets/todo_listtile.dart';

import '../widgets/my_bottom_sheet_widget.dart';

class ToDoController with ChangeNotifier {
  List<String> taskList = [];
  
  TextEditingController textController = TextEditingController();

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return const MyBottomSheetWidget();
      },
    );
    notifyListeners();
  }

  void addList() {
    taskList.add(textController.text);
    
    notifyListeners();
  }
}

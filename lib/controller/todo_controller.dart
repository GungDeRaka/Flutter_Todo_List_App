import 'package:flutter/material.dart';

import '../widgets/my_bottom_sheet_widget.dart';

class ToDoController with ChangeNotifier {
  List<String> toDos = [];
  TextEditingController textController = TextEditingController();

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return MyBottomSheetWidget(); });
          notifyListeners();
  }

  void addList() {
    toDos.add(textController.text);
  }
}

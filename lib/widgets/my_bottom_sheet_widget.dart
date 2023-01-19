import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/controller/todo_controller.dart';

class MyBottomSheetWidget extends StatelessWidget {
  const MyBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ToDoController>(
      create: (context) => ToDoController(),
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
          border: Border.all(
            width: 1.0,
            color: Colors.white70,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: context.read<ToDoController>().textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "New task",
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  context.read<ToDoController>().addList();
                  print(context.read<ToDoController>().taskList);
                  Navigator.pop(context);
                  context.read<ToDoController>().textController.clear();
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
        height: 150,
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
              const SizedBox(
              height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColorDark
                    ),
                    onPressed: () {
                      context.read<ToDoController>().addTask();
                      print(context.read<ToDoController>().taskList);
                      Navigator.pop(context);
                      context.read<ToDoController>().textController.clear();
                    },
                    child: const Text("Save"),
                  ),
                  const SizedBox(
                  width: 8.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[300],
                    ),
                    onPressed: () {
                      print(context.read<ToDoController>().taskList);
                      
                      Navigator.pop(context);
                      context.read<ToDoController>().textController.clear();
                    },
                    child: const Text("Cancel"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

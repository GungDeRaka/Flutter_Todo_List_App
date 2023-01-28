// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list_app/controller/todo_controller.dart';

class MyBottomSheetWidget extends StatelessWidget {
  const MyBottomSheetWidget({
    Key? key,
    required this.onSaved,
    required this.onCanceled,
  }) : super(key: key);

  ///[onSaved]
  final VoidCallback? onSaved;
  final VoidCallback? onCanceled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
        border: Border.all(
          width: 1.0,
          color: Theme.of(context).indicatorColor,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: context.read<ToDoController>().textController,
                decoration: InputDecoration(
                  enabledBorder:const OutlineInputBorder(
                    borderRadius:  BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    borderSide: BorderSide(
                      width: 0.5,
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    borderSide: BorderSide(
                      width: 2.5,
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
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
                      backgroundColor: Colors.red[300],
                    ),
                    onPressed: onCanceled,
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).indicatorColor),
                    onPressed: onSaved,
                    child: const Text("Save"),
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

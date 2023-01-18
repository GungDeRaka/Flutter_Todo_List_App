import 'package:flutter/material.dart';

class MyBottomSheetWidget extends StatelessWidget {
  const MyBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
              topLeft:Radius.circular(8.0),
              topRight: Radius.circular(8.0),
              ),
              border: Border.all(
                width: 1.0,
                color: Colors.white70,
              ),
            ),
            child: Column(
            children: [Text("text",
            style: TextStyle(
            fontSize: 24.0,
            ),
            ),ElevatedButton(
            style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
            ),
            onPressed: () {Navigator.pop(context);},
            child: const Text("Save"),
            ),],
            ),
          );
       
  }
}
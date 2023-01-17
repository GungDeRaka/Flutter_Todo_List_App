import 'package:flutter/material.dart';

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("ToDo",
      style: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      ),
      ),),
    );
  }
}
import 'package:flutter/material.dart';

class HaveDone extends StatelessWidget {
  const HaveDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child:Text("Have Done",
      style: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      ),
      ),),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:todo_list_app/screens/have_done_screen.dart';
import 'package:todo_list_app/screens/todo_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> myScreens = const [ToDo(), HaveDone()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScreens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 16,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "TO DO"),
            BottomNavigationBarItem(
                icon: Icon(Icons.delete_outline), label: "DONE")
          ]),
    );
  }
}

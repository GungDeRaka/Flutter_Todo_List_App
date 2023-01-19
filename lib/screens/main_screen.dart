import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/controller/todo_controller.dart';
import 'package:todo_list_app/screens/have_done_screen.dart';
import 'package:todo_list_app/screens/todo_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final List<Widget> myScreens = const [ToDo(), HaveDone()];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: myScreens[currentIndex],
        floatingActionButton:  (currentIndex == 0)
              ? FloatingActionButton(
                  onPressed: () {
                    context.read<ToDoController>().bottomSheet(context);
                  },
                  heroTag: "FAB",
                  child: const Icon(Icons.add),
                )
              : FloatingActionButton(
                  onPressed: () {
                    context.read<ToDoController>().bottomSheet(context);
                  },
                  heroTag: "FAB",
                  child: const Icon(Icons.delete_forever_sharp),
                ),
        
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Hero(
          tag: "FAB",
          child: BottomNavigationBar(
              unselectedItemColor: Colors.white,
              showUnselectedLabels: false,
              elevation: 16,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              currentIndex: currentIndex,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Tasks"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_outlined), label: "Completed")
              ]),
        ),
      );
  }
}

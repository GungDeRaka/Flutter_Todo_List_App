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
    return MultiProvider(
      providers: [ChangeNotifierProvider<ToDoController>(create: (context) => ToDoController(),)],
      child: Scaffold(
        body: myScreens[currentIndex],
        floatingActionButton: Consumer<ToDoController>(
          builder:(context, todo, child) => (currentIndex == 0)? FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              todo.bottomSheet(context);
            },heroTag: "FAB",
          ) : FloatingActionButton(
            child: const Icon(Icons.delete_forever_sharp),
            onPressed: () {
              todo.bottomSheet(context);
            },heroTag: "FAB",
          ),
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
      ),
    );
  }
}

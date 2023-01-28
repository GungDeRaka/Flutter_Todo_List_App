import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/todo_controller.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ToDoController>(
          create: (context) => ToDoController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter ToDo List App",
        darkTheme: ThemeData.dark(useMaterial3: false),
        themeMode: ThemeMode.dark,
        home: const MainScreen(),
      ),
    );
  }
}

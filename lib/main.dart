import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'controller/todo_controller.dart';
import 'model/task_model.dart';
import 'screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDir = await pathProvider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocDir.path);
  Hive.registerAdapter(MyTaskAdapter());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

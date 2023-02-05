import 'package:hive/hive.dart';

class MyTask {
  String? taskName;
  bool? isDone;
  bool? isRetrieved;

  MyTask(this.taskName, this.isDone, this.isRetrieved);

  MyTask.uncomplete({this.taskName, this.isDone, this.isRetrieved});
  MyTask.completed({this.taskName, this.isDone, this.isRetrieved});
}

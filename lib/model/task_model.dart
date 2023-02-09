// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0,)
class MyTask {
  @HiveField(0)
  String? taskName;
  @HiveField(1)
  bool? isDone;
  @HiveField(2)
  bool? isRetrieved;

  MyTask(this.taskName, this.isDone, this.isRetrieved);

  MyTask.uncomplete({this.taskName, this.isDone, this.isRetrieved});
  // MyTask.completed({this.taskName, this.isDone, this.isRetrieved});
  

  @override
  String toString() => 'MyTask(taskName: $taskName, isDone: $isDone, isRetrieved: $isRetrieved)';

  @override
  noSuchMethod(Invocation invocation) {
   super.noSuchMethod(invocation);
   print(invocation);
  }
}

import 'package:task_manager/models/task.dart';

class Space {
  final int id;
  String name;
  int priority;
  List<Task> tasks;

  Space({
    required this.id,
    required this.name,
    required this.priority,
    this.tasks = const [],
  });
}

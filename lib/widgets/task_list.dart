import 'package:flutter/material.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (ctx, index) {
        final task = tasks[index];
        return TaskTile(
          name: task.name,
          status: task.status,
          deadline: task.deadline,
          onChanged: (value) {
            // Implement task completion logic
          },
        );
      },
    );
  }
}

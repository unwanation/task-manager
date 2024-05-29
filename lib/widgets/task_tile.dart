import 'package:flutter/material.dart';
import 'package:task_manager/services/task_service.dart';

class TaskTile extends StatelessWidget {
  final int taskId;
  final String name;
  final bool status;
  final int deadline;
  final void Function(bool?) onChanged;

  const TaskTile({
    super.key,
    required this.taskId,
    required this.name,
    required this.status,
    required this.deadline,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text('${(deadline / 3600).round()} hours'),
      trailing: IconButton(
          onPressed: () {
            TaskService.deleteTask(taskId);
          },
          icon: const Icon(Icons.delete)),
    );
  }
}

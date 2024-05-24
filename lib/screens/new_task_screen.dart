import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/providers/task_provider.dart';

class NewTaskScreen extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();

  void _addTask(BuildContext context) {
    final taskText = _taskController.text;
    if (taskText.isNotEmpty) {
      Provider.of<TaskProvider>(context, listen: false).addTask(Task(
        id: ++Task.nextId,
        name: taskText,
        status: false,
        deadline: 36000,
      ));
      Navigator.of(context).pop();
    }
  }

  NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _taskController,
              decoration: const InputDecoration(labelText: 'Task'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _addTask(context),
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}

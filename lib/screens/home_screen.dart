import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/providers/task_provider.dart';
import 'package:task_manager/widgets/new_task_action_button.dart';
import 'package:task_manager/widgets/task_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).tasks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: TaskList(
        tasks: tasks,
      ),
      floatingActionButton: const NewTaskActionButton(),
    );
  }
}

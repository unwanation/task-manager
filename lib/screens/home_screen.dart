import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/providers/user_provider.dart';
import 'package:task_manager/widgets/new_task_action_button.dart';
import 'package:task_manager/widgets/task_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<UserProvider>(context).user?.spaces[0].tasks;

    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<UserProvider>(context).user?.name ?? 'Tasks'),
        automaticallyImplyLeading: false,
      ),
      body: TaskList(
        tasks: tasks ?? [],
      ),
      floatingActionButton: const NewTaskActionButton(),
    );
  }
}

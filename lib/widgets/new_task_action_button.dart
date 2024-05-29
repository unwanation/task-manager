import 'package:flutter/material.dart';

class NewTaskActionButton extends StatelessWidget {
  const NewTaskActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: const Text('New Task'),
      onPressed: () {
        Navigator.of(context).pushNamed('/new-task');
      },
      icon: const Icon(Icons.add),
    );
  }
}

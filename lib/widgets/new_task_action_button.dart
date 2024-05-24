import 'package:flutter/material.dart';

class NewTaskActionButton extends StatelessWidget {
  const NewTaskActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/new-task');
      },
      child: const Icon(Icons.add),
    );
  }
}

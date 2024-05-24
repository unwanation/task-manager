import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String name;
  final bool status;
  final int deadline;
  final void Function(bool?) onChanged;

  const TaskTile({
    super.key,
    required this.name,
    required this.status,
    required this.deadline,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      leading: Checkbox(
        onChanged: onChanged,
        value: status,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/providers/task_provider.dart';
import 'package:task_manager/screens/home_screen.dart';
import 'package:task_manager/screens/new_task_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'Task Manager',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => const HomeScreen(),
          '/new-task': (ctx) => NewTaskScreen(),
          // Add more routes if needed
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/providers/auth_provider.dart';
import 'package:task_manager/providers/task_provider.dart';
import 'package:task_manager/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TaskProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Manager',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.getInitial(context),
        routes: Routes.routes,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:projeto_flutter_treino_3/data/task_inherited.dart';

import 'screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Home',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TaskInherited (child: const InicialScreen()),
    );}
}







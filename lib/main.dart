import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Home',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Projeto Flutter - Treino'),
          ),
          body: ListView(
            children: [
              Task('Atividade 1'),
              Task('Atividade 2'),
            ],
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {}),
        ));
  }
}

class Task extends StatelessWidget {
  final String nameTask;

  const Task(this.nameTask, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            color: Colors.blueAccent,
            height: 140,
          ),
          Container(
            color: Colors.white,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 70,
                  color: Colors.black26,
                ),
                Container(
                  width: 200,
                  child: Text(
                    nameTask,
                    style: const TextStyle(
                        fontSize: 24, overflow: TextOverflow.ellipsis),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Icon(Icons.arrow_drop_up))
              ],
            ),
          )
        ],
      ),
    );
  }
}

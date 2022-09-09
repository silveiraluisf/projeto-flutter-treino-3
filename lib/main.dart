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
            leading: Icon(Icons.home),
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

class Task extends StatefulWidget {
  final String nameTask;

  const Task(this.nameTask, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

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
          Column(
            children: [
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
                        widget.nameTask,
                        style: const TextStyle(
                            fontSize: 24, overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Container(
                      width: 52,
                      height: 52,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
                            });
                            print(nivel);
                          },
                          child: Column(children: const [
                            Icon(Icons.arrow_drop_up),
                            Text('UP')])),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      child: LinearProgressIndicator(
                        value: nivel / 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Nível: $nivel',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

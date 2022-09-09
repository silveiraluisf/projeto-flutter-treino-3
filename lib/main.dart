import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacityView = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Home',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.home),
            title: const Text('Projeto Flutter - Treino'),
          ),
          body: AnimatedOpacity(
            opacity: opacityView ? 1 : 0,
            duration: const Duration(milliseconds: 800),
            child: ListView(
              children: const [
                Task(
                    'Atividade 1',
                    'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                    3),
                Task(
                    'Atividade 2',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtDpscDwFeM0Fv3c7qKSJ4RdYp7r58UCsoWA&usqp=CAU',
                    5),
                Task(
                    'Atividade 3',
                    'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
                    2)
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                opacityView = !opacityView;
              });
            },
            child: const Icon(Icons.remove_red_eye),
          ),
        ));
  }
}

class Task extends StatefulWidget {
  final String nameTask;
  final String photo;
  final int difficulty;

  const Task(this.nameTask, this.photo, this.difficulty, {Key? key})
      : super(key: key);

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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blueAccent),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26),
                      height: 100,
                      width: 70,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            widget.photo,
                            fit: BoxFit.cover,
                          )),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nameTask,
                            style: const TextStyle(
                                fontSize: 24, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star,
                                size: 15,
                                color: (widget.difficulty >= 1)
                                    ? Colors.blue
                                    : Colors.blue[100]),
                            Icon(Icons.star,
                                size: 15,
                                color: (widget.difficulty >= 2)
                                    ? Colors.blue
                                    : Colors.blue[100]),
                            Icon(Icons.star,
                                size: 15,
                                color: (widget.difficulty >= 3)
                                    ? Colors.blue
                                    : Colors.blue[100]),
                            Icon(Icons.star,
                                size: 15,
                                color: (widget.difficulty >= 4)
                                    ? Colors.blue
                                    : Colors.blue[100]),
                            Icon(Icons.star,
                                size: 15,
                                color: (widget.difficulty >= 5)
                                    ? Colors.blue
                                    : Colors.blue[100]),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 52,
                      height: 52,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
                            });
                          },
                          child: Column(children: const [
                            Icon(Icons.arrow_drop_up),
                            Text('UP')
                          ])),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        value: (widget.difficulty > 0)
                            ? (nivel / widget.difficulty) / 10
                            : 1,
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

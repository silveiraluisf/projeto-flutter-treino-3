import 'package:flutter/material.dart';
import 'package:projeto_flutter_treino_3/task.dart';

class InicialScreen extends StatefulWidget {
  const InicialScreen({Key? key}) : super(key: key);

  @override
  State<InicialScreen> createState() => _InicialScreenState();
}

class _InicialScreenState extends State<InicialScreen> {
  bool opacityView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

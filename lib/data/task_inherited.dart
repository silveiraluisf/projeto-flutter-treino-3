import 'package:flutter/cupertino.dart';
import '../components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Atividade 1',
        'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
        3),
    Task(
        'Atividade 2',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtDpscDwFeM0Fv3c7qKSJ4RdYp7r58UCsoWA&usqp=CAU',
        5),
    Task(
        'Atividade 3',
        'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
        2),
  ];

  void newTask(String nameTask, String photo, int difficultyLevel){
    taskList.add(Task(nameTask, photo, difficultyLevel));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}

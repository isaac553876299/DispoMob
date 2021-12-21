import 'package:flutter/material.dart';
import 'package:example/models/task_model.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  final List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
  ];

  TaskWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.task,
        size: 50,
        color: colors[task.priority],
      ),
      title: Text(
        task.title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
      ),
      subtitle: Text(task.date.toString(),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          )),
    );
  }
}

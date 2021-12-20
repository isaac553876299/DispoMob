import 'package:flutter/material.dart';
import 'package:example/models/task_model.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  const TaskWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text('admin: '+task.admin),
              Spacer(),
              Text('title: '+task.title),
              Spacer(),
              Text('date: '+task.date.toString()),
              Spacer(),
              Text('description: '+task.description!),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

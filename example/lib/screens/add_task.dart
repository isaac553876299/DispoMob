import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text('title: '),
              TextField(controller: controller),
            ],
          ),
          Row(
            children: [
              Text('priority: '),
              TextField(controller: controller),
            ],
          ),
        ],
      ),
    );
  }
}

//if (controller.text.isNotEmpty) controller.text, controller.clear();
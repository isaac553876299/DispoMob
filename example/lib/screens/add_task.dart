import 'package:flutter/material.dart';
import 'package:example/models/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late TextEditingController controller1, controller2;

  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'title: ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(child: TextField(controller: controller1)),
              ],
            ),
            Row(
              children: [
                Text(
                  'priority: ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(child: TextField(controller: controller2)),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              onPressed: () {
                setState(
                  () {
                    if (controller1.text.isNotEmpty &&
                        controller2.text.isNotEmpty) {
                      Task t = Task(controller1.text, DateTime.now(), [],
                          int.parse(controller2.text)); //some input gives error
                      //save to firebase here
                      Navigator.of(context).pop();
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//if (controller.text.isNotEmpty) controller.text, controller.clear();
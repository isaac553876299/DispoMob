import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:example/models/task_model.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late TextEditingController controller1, controller2, controller3;

  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    final tasks = db.collection("/tasks");
    String date = "";
    List<String> users = [];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
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
                const SizedBox(width: 10),
                Expanded(
                    child: TextField(
                  controller: controller1,
                  onSubmitted: (text) {
                    setState(() {
                      users.add(text);
                      controller3.clear();
                    });
                  },
                )),
              ],
            ),
            /*Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) => Text(users[index]),
                ),
              ),
            ),
            Expanded(child: TextField(controller: controller3)),*/
            Expanded(
              child: TextFormField(
                controller: controller2,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-4]')),
                ],
                decoration: const InputDecoration(
                  labelText: "priority",
                  hintText: "input color 0 to 4",
                  icon: Icon(Icons.color_lens),
                ),
              ),
            ),
            Expanded(
              child: SfDateRangePicker(
                onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                  if (args.value is DateTime) {
                    date = args.value.toString();
                  }
                },
                selectionMode: DateRangePickerSelectionMode.single,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text(
                'Save',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              onPressed: () {
                setState(
                  () {
                    if (controller1.text.isNotEmpty &&
                        controller2.text.isNotEmpty) {
                      Task t = Task(
                          controller1.text,
                          DateTime.parse(date),
                          users,
                          int.parse(controller2.text)); //some input gives error
                      tasks.add(t.toFirestore());
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
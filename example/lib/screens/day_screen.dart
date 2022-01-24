import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/screens/add_task.dart';
import 'package:example/widgets/task_widget.dart';
import 'package:flutter/material.dart';
import 'package:example/models/task_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DayScreen extends StatefulWidget {
  final DateTime date;
  DayScreen({Key? key, required this.date}) : super(key: key);
  @override
  _DayScreenState createState() => _DayScreenState();
}

class _DayScreenState extends State<DayScreen> {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    final tasks = db.collection('tasks');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Tasks",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddTaskScreen(),
                  ),
                );
              });
            },
            icon: const Icon(
              Icons.add,
              size: 30,
              color: Colors.black26,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.logout,
              size: 30,
              color: Colors.black26,
            ),
            onPressed: () {
              setState(() {
                FirebaseAuth.instance.signOut();
              });
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: taskSnapshots(widget.date),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Task>> snapshot,
        ) {
          if (snapshot.hasError) {
            return ErrorWidget(snapshot.error!);
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => GestureDetector(
                        child: TaskWidget(task: snapshot.data![index]),
                        onLongPress: () {
                          showDialog<bool>(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Confirm Delete"),
                                content: Text(
                                  "Are you sure you want to "
                                  "delete '${snapshot.data![index].title}'?",
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text("Cancel"),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                  TextButton(
                                    child: const Text("Delete"),
                                    onPressed: () => {
                                      setState(() {
                                        tasks
                                            .doc(snapshot.data![index].id)
                                            .delete();
                                        Navigator.of(context).pop();
                                      })
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ));
            case ConnectionState.done:
              return ErrorWidget("Firestore Stream finished????");
            case ConnectionState.none:
              return ErrorWidget("taskSnapshots returned null!!");
          }
        },
      ),
    );
  }
}

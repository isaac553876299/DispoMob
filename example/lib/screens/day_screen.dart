import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/widgets/task_widget.dart';
import 'package:flutter/material.dart';
import 'package:example/models/task_model.dart';

class DayScreen extends StatefulWidget {
  DayScreen({Key? key}) : super(key: key);

  @override
  _DayScreenState createState() => _DayScreenState();
}

class _DayScreenState extends State<DayScreen> {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    final user = db.collection("users");
    final docRef = user.doc("JcjZjYkn7BrSG9gkLsXr");
    final tasks = docRef.collection("tasks");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[100],
        title: Text(
          "Tasks",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: taskSnapshots(tasks),
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
                  itemBuilder: (context, index) =>
                      TaskWidget(task: snapshot.data![index]));
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

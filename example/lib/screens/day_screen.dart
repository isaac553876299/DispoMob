import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:example/models/task_model.dart';

class DayScreen extends StatefulWidget {
  late List<Task> tasks;
  DayScreen({Key? key}) : super(key: key);

  @override
  _DayScreenState createState() => _DayScreenState();
}

class _DayScreenState extends State<DayScreen> {
  Widget _firebaseTest(String descr, void Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(descr),
    );
  }

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
        stream: docRef.snapshots(),
        builder: (
          BuildContext context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot,
        ) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final doc = snapshot.data!.data()!;
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  doc['texto'] ?? "<not found>",
                  style: TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: () {
                    docRef.set({'texto': 'Hola, mundo!'});
                  },
                  child: Text("Reset"),
                ),
                _firebaseTest("Actualizar un documento", () {
                  docRef.update({
                    'updated': true,
                    'texto': "Texto Actualizado",
                  });
                }),
                _firebaseTest("Sobreescribir un documento", () {
                  docRef.set({'a': "hola", 'b': 123});
                }),
                _firebaseTest("Añadir documento a mensajes", () async {
                  final newdoc = await task.add({'a': true, 'b': 17});
                  debugPrint(newdoc.id);
                }),
                _firebaseTest("Añadir un documento con un ID", () async {
                  task.doc("aaabbccc").set({'nuevo': true});
                  final snapshot = await docRef.get();
                  final fields = snapshot.data()!;
                  fields.remove('name');
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}

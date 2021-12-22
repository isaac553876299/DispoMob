import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Task {
  String? id;
  late String title;
  late DateTime date;
  late List<String> users;
  late int priority;

  Task(this.title, this.date, this.users, this.priority);

  Task.fromFirestore(String _id, Map<String, dynamic> data)
      : id = _id,
        title = data['title'],
        date = (data['date'] as Timestamp).toDate(),
        users = (data['users'] as List).cast<String>(),
        priority = data['priority'];

  Map<String, dynamic> toFirestore() => {
        'title': title,
        'date': Timestamp.fromDate(date),
        'users': users,
        'priority': priority,
      };
}

Stream<List<Task>> taskSnapshots() {
  final db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;
  final stream = db
      .collection('tasks')
      /*.where('users', arrayContains: user.uid)*/
      .orderBy('date')
      .snapshots();
  return stream.map((querySnapshot) {
    List<Task> tasks = [];
    for (final doc in querySnapshot.docs) {
      tasks.add(Task.fromFirestore(doc.id, doc.data()));
    }
    return tasks;
  });
}

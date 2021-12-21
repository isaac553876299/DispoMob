import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  late String title;
  late DateTime date;
  late List<String> users;

  Task(this.title, this.date, this.users);

  Task.fromFirestore(Map<String, dynamic> data)
      : title = data['title'],
        date = (data['date'] as Timestamp).toDate(),
        users = (data['users'] as List).cast<String>();

  Map<String, dynamic> toFirestore() => {
        'title': title,
        'date': Timestamp.fromDate(date),
        'users': users,
      };
}

Stream<List<Task>> taskSnapshots(
    CollectionReference<Map<String, dynamic>> coll) {
  final stream = coll.snapshots();
  return stream.map((querySnapshot) {
    List<Task> tasks = [];
    for (final doc in querySnapshot.docs) {
      tasks.add(Task.fromFirestore(doc.data()));
    }
    return tasks;
  });
}

import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  late String admin;
  late String title;
  late DateTime date;
  late String? description;
  late List<String> users;

  Task(this.admin, this.title, this.date, this.description, this.users);

  Task.fromFirestore(Map<String, dynamic> data)
      : admin = data['admin'],
        title = data['title'],
        date = (data['date'] as Timestamp).toDate(),
        description = data['description'],
        users = data['users'];

  Map<String, dynamic> toFirestore() => {
        'admin': admin,
        'title': title,
        'date': Timestamp.fromDate(date),
        'description': description,
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
  return stream.map((QuerySnapshot<Map<String, dynamic>> qsnapshot) {
    final docs = qsnapshot.docs;
    List<Task> tasks =
        docs.map((QueryDocumentSnapshot<Map<String, dynamic>> dsnapshot) {
      final data = dsnapshot.data();
      return Task.fromFirestore(data);
    }).toList();
    return tasks;
  });
}

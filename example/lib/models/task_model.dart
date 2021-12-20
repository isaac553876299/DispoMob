import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  late int admin;
  late String title;
  late DateTime date;
  late String? description;
  late List<int> users;

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

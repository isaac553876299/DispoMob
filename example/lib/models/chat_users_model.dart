import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatUsers {
  final id;
  String name;
  List<String> messageList;
  String avatar;
  String time;

  ChatUsers(this.id, this.name, this.messageList, this.avatar, this.time);

  ChatUsers.empty()
      : id = 0,
        name = ' ',
        messageList = [],
        avatar = '',
        time = ' ';
}

Future<void> userExists() async {
  final db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;
  final docRef = db.doc("/users/${user.uid}");
  final docSnap = await docRef.get();
  if (!docSnap.exists) {
    await docRef.set({
      'avatar':
          "https://media.discordapp.net/attachments/920621903243268106/923177946825515008/da.png",
    });
  }
}

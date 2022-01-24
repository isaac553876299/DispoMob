// ignore_for_file: must_be_immutable, use_key_in_widget_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/mock/mock_chat_users.dart';
import 'package:example/models/chat_users_model.dart';
import 'package:example/screens/single_chat_window.dart';
import 'package:example/widgets/conversation_list.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  var faker = Faker();

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final db = FirebaseFirestore.instance;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  List<ChatUsers> chatUsers = MockChatUsers.fetchAll();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Conversations",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: [
          Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.pink[50],
            ),
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.add,
                  color: Colors.pink,
                  size: 20,
                ),
                const SizedBox(
                  width: 2,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    textStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SingleChat(0),
                      ),
                    );
                  },
                  child: const Text("Add New"),
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        // body section is entirely scrollable
        physics:
            const BouncingScrollPhysics(), //bouncing effect when a user's scrolling reaches the end or beginning
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
            StreamBuilder(
                stream: chatSnapshots(),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<List<ConversationList>> snapshot,
                ) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 16),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return snapshot.data![index];
                      });
                }),
          ],
        ),
      ),
    );
  }
}

Stream<List<ConversationList>> chatSnapshots() {
  final db = FirebaseFirestore.instance;
  final stream =
      db.collection('users/JcjZjYkn7BrSG9gkLsXr/conversation').snapshots();
  return stream.map((querySnapshot) {
    List<ConversationList> chats = [];
    for (final doc in querySnapshot.docs) {
      chats.add(
        ConversationList(
          doc,
          doc['name'],
          doc['messages'][0],
          doc['avatar'],
          doc['time'],
          doc['isRead'],
        ),
      );
    }
    return chats;
  });
}

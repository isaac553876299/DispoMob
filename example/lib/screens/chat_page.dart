// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:example/mock/mock_chat_users.dart';
import 'package:example/models/chat_users_model.dart';
import 'package:example/widgets/conversation_list.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {

  var faker = Faker();

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  List<ChatUsers> chatUsers =  
    MockChatUsers.fetchAll() ; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // body section is entirely scrollable
        physics: const BouncingScrollPhysics(), //bouncing effect when a user's scrolling reaches the end or beginning
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text("Conversations",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          const Icon(Icons.add,color: Colors.pink,size: 20,),
                          const SizedBox(width: 2,),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                              textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            onPressed: null, // TO DO - create Add_New_Screen
                            child: const Text("Add New"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.grey.shade100
                    )
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return ConversationList(
                  chatUsers[index].id,
                  chatUsers[index].name,
                  chatUsers[index].messageList.last,
                  chatUsers[index].avatar,
                  chatUsers[index].time,
                  (index == 0 || index == 3)?true:false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
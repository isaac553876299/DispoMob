import 'package:example/models/chat_users_model.dart';
import 'package:example/widgets/conversation_list.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Pablo Galve", messageText: "Good job", imageURL: "", time: "Now"),
    ChatUsers(name: "Joan Rodriguez", messageText: "That's great", imageURL: "", time: "Yesterday"),
    ChatUsers(name: "Jorge Henry", messageText: "Hey, where are you?", imageURL: "", time: "31 Mar"),
    ChatUsers(name: "Anna Foster", messageText: "Answer!", imageURL: "", time: "28 Mar"),
    ChatUsers(name: "Emily Hawkins", messageText: "Thank you, It's awesome", imageURL: "", time: "23 Mar"),
    ChatUsers(name: "Santiago Pena", messageText: "will update you in evening", imageURL: "", time: "17 Mar"),
    ChatUsers(name: "Marta Rodriguez", messageText: "Can you please share the file?", imageURL: "", time: "24 Feb"),
    ChatUsers(name: "Francisco Cortez", messageText: "How are you?", imageURL: "", time: "18 Feb"),
    ChatUsers(name: "Philip Fox", messageText: "Busy! Call me in 20 mins", imageURL: "", time: "28 Mar"),
    ChatUsers(name: "Emily Hawkins", messageText: "Thanks", imageURL: "", time: "23 Mar"),
    ChatUsers(name: "Juan Perez", messageText: "Everything okay?", imageURL: "", time: "17 Mar"),
    ChatUsers(name: "Marta Rodriguez", messageText: "Can you please share the file?", imageURL: "", time: "24 Feb"),
    ChatUsers(name: "Andrea Gioia", messageText: "Have you been talking?", imageURL: "", time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // body section is entirely scrollable
        physics: BouncingScrollPhysics(), //bouncing effect when a user's scrolling reaches the end or beginning
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Conversations",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add,color: Colors.pink,size: 20,),
                          SizedBox(width: 2,),
                          Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
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
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3)?true:false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
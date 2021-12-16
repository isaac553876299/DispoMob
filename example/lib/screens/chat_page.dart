import 'package:example/models/chat_users_model.dart';
import 'package:example/widgets/conversation_list.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {

  var faker = new Faker();

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  List<ChatUsers> chatUsers = [
    ChatUsers(name: faker.person.name(), messageText: "Good job", avatar: "https://i.pravatar.cc/1000", time: "Now"),
    ChatUsers(name: faker.person.name(), messageText: "That's great", avatar: "https://i.pravatar.cc/950", time: "Yesterday"),
    ChatUsers(name: faker.person.name(), messageText: "Hey, where are you?", avatar: "https://i.pravatar.cc/900", time: "31 Mar"),
    ChatUsers(name: faker.person.name(), messageText: "Answer!", avatar: "https://i.pravatar.cc/850", time: "28 Mar"),
    ChatUsers(name: faker.person.name(), messageText: "Thank you, It's awesome", avatar: "https://i.pravatar.cc/800", time: "23 Mar"),
    ChatUsers(name: faker.person.name(), messageText: "will update you in evening", avatar: "https://i.pravatar.cc/300", time: "17 Mar"),
    ChatUsers(name: faker.person.name(), messageText: "Can you please share the file?", avatar: "https://i.pravatar.cc/320", time: "24 Feb"),
    ChatUsers(name: faker.person.name(), messageText: "How are you?", avatar: "https://i.pravatar.cc/450", time: "18 Feb"),
    ChatUsers(name: faker.person.name(), messageText: "Busy! Call me in 20 mins", avatar: "https://i.pravatar.cc/300", time: "28 Mar"),
    ChatUsers(name: faker.person.name(), messageText: "Thanks", avatar: "https://i.pravatar.cc/800", time: "23 Mar"),
    ChatUsers(name: faker.person.name(), messageText: "Everything okay?", avatar: "https://i.pravatar.cc/240", time: "17 Mar"),
    ChatUsers(name: faker.person.name(), messageText: "Can you please share the file?", avatar: "https://i.pravatar.cc/370", time: "24 Feb"),
    ChatUsers(name: faker.person.name(), messageText: "Have you been talking?", avatar: "https://i.pravatar.cc/500", time: "18 Feb"),
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
                  imageUrl: chatUsers[index].avatar,
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
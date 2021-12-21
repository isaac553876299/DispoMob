import 'package:cloud_firestore/cloud_firestore.dart';

class ChatUsers{
  final int id;
  String name;
  List<String> messageList;
  String avatar;
  String time;
  
  ChatUsers(
    this.id,
    this.name, 
    this.messageList,
    this.avatar, 
    this.time
  );

  ChatUsers.empty()
    : id = 0,
      name = ' ',
      messageList = [],
      avatar = '',
      time = ' ';
}
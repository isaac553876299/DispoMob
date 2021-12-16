import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatUsers{
  String name;
  String messageText;
  String avatar;
  String time;
  
  ChatUsers({
    required this.name, 
    required this.messageText, 
    required this.avatar, 
    required this.time
  });
}

String createAvatarLink(String name){
  return "https://eu.ui-avatars.com/api/?name=$name&background=2f855a&color=fff";
}

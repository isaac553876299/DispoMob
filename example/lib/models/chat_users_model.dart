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

String createAvatarLink(String name){
  return "https://eu.ui-avatars.com/api/?name=$name&background=2f855a&color=fff";
}

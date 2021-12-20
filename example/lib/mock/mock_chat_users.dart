import 'package:example/models/chat_users_model.dart';
import 'package:faker/faker.dart';

mixin MockChatUsers implements ChatUsers{

  static final List<ChatUsers> items = [
    ChatUsers(
      0,
      faker.person.name(),
      ["Hello, it's me", "What's up?"],
      "https://i.pravatar.cc/500",
      //"https://eu.ui-avatars.com/api/?name=$faker.person.name(&background=2f855a&color=fff",
      "5 minutes ago"
    ),
    ChatUsers(
      1,
      faker.person.name(),
      ["Have you delivered it?"],
      "https://i.pravatar.cc/1000",
      "Yesterday"
    ),ChatUsers(
      2,
      faker.person.name(),
      ["Sorry, I can't now", "Talk to you tomorrow", "Bye"],
      "https://i.pravatar.cc/800",
      "3 days ago"
    ),ChatUsers(
      3,
      faker.person.name(),
      ["How was the trip?", "Oh, really?", "Okay!"],
      "https://i.pravatar.cc/700",
      "12 dec"
    ),
  ];

  static fetchAll() {
    return items;
  }

  static ChatUsers fetchByID(int index) {
    return items[index];
  }
}
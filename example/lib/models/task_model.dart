class Todo {
  late String title;
  late String description;
  late bool done;
}

class Poll {
  late String title;
  late String description;
  //only one option?
  late int min;
  late int total;
  late int yes;
}

class Task {
  late int admin;
  late List<int> users;
  late DateTime date;
  late String description;
  late int priority;
  late List<Todo> todos;
  late List<Poll> polls;
  //chat
}

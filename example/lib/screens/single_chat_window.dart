import 'package:example/mock/mock_chat_users.dart';
import 'package:example/models/chat_users_model.dart';
import 'package:flutter/material.dart';

class SingleChat extends StatefulWidget {

  final int chatId;
  SingleChat(this.chatId);

  @override
  _SingleChatState createState() => _SingleChatState(chatId);
}

class _SingleChatState extends State<SingleChat> {

  final int chatId;
  ChatUsers user = ChatUsers.empty();

  _SingleChatState(this.chatId);

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(children: [],),
    );
  }

  loadData() {
    final chatUser = MockChatUsers.fetchByID(this.chatId);

    if (mounted) {
      setState(() {
        this.user = chatUser;
      });
    }
  }

  Widget _renderBody(BuildContext context, ChatUsers chat_user) {
    var result = <Widget>[];
    result.add(_renderTitle());
    result.add(_renderMessages());
    result.add(_renderTextField());
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: result
      ),
    );
  }

  Widget _renderTitle(){
    return Text("Test");
  }

  Widget _renderMessages(){
    return Container();
  }

  Widget _renderTextField(){
    return Container();
  }

}

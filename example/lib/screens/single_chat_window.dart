// ignore_for_file: non_constant_identifier_names, unused_element, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, no_logic_in_create_state

import 'package:example/mock/mock_chat_users.dart';
import 'package:example/models/chat_users_model.dart';
import 'package:example/widgets/chat_body.dart';
import 'package:flutter/material.dart';

class SingleChat extends StatefulWidget {
  final chatId;
  SingleChat(this.chatId);

  @override
  _SingleChatState createState() => _SingleChatState(chatId);
}

class _SingleChatState extends State<SingleChat> {
  final chatId;
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
      body: Stack(
        children: [
          _renderTextField(),
        ],
      ),
    );
  }

  loadData() {
    final chatUser = MockChatUsers.fetchByID(0);

    if (mounted) {
      setState(() {
        user = chatUser;
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
          children: result),
    );
  }

  Widget _renderTitle() {
    return const Text("Test");
  }

  Widget _renderMessages() {
    return Container();
  }

  Widget _renderTextField() {
    return ChatBody(doc: chatId);
  }
}

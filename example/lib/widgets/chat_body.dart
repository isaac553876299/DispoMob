import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatBody extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> doc;
  const ChatBody({Key? key, required this.doc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder(
            stream: doc.reference.snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                    snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                List<dynamic> message = doc['messages'];
                return Expanded(
                    child: ListView.builder(
                        itemCount: message.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            margin: EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Text(message[index].toString()),
                            width: message[index].toString().length.toDouble(),
                          );
                        }));
              }
            }),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: SafeArea(
              child: Row(
            children: [
              CreateIconButton(
                context,
                Icon(
                  Icons.mic,
                  color: Colors.blue[300],
                ),
                null,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      CreateIconButton(
                        context,
                        Icon(
                          Icons.sentiment_satisfied_alt_outlined,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color
                              ?.withOpacity(0.64),
                        ),
                        null,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                        ),
                      )),
                      CreateIconButton(
                        context,
                        Icon(
                          Icons.attach_file_outlined,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color
                              ?.withOpacity(0.64),
                        ),
                        null,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CreateIconButton(
                          context,
                          Icon(
                            Icons.camera_alt_outlined,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .color
                                ?.withOpacity(0.64),
                          ),
                          null),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              CreateIconButton(
                context,
                const Icon(
                  Icons.send_rounded,
                  size: 30,
                  color: Colors.blue,
                ),
                null,
              ),
            ],
          )),
        )
      ],
    );
  }

  void buildEmoji() async {}

  // ignore: non_constant_identifier_names
  IconButton CreateIconButton(context, Icon icon, Function()? onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
    );
  }
}

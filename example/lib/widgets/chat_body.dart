import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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

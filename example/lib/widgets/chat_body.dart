import 'package:flutter/material.dart';

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
              Icon(
                Icons.mic,
                color: Colors.green[300],
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
                      Icon(
                        Icons.sentiment_satisfied_alt_outlined,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color
                            ?.withOpacity(0.64),
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
                      Icon(
                        Icons.attach_file_outlined,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color
                            ?.withOpacity(0.64),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color
                            ?.withOpacity(0.64),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
        )
      ],
    );
  }
}

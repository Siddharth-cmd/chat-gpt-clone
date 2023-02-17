import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_gpt_clone/provider/chat_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatConvo extends StatefulWidget {
  const ChatConvo({super.key});

  @override
  State<ChatConvo> createState() => _ChatConvoState();
}

class _ChatConvoState extends State<ChatConvo> {
  Widget result = const Text("error");

  @override
  Widget build(BuildContext context) {
    var chatMessages = context.watch<ChatData>().chatMessages;
    return ListView.builder(
      itemBuilder: ((context, index) {
        if (chatMessages[index]['chatIndex'] == 0) {
          result = Container(
            padding: const EdgeInsets.all(20.0),
            color: const Color(0xFF343541),
            child: ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: const Icon(
                Icons.person,
              ),
              title: Text(
                chatMessages[index]['msg'].toString(),
              ),
            ),
          );
        } else {
          result = Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            padding: const EdgeInsets.all(20.0),
            color: const Color(0xFF444654),
            child: ListTile(
              iconColor: Colors.teal,
              textColor: const Color(0xFFd1d3c5),
              leading: const Icon(
                Icons.rocket,
              ),
              title: AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TypewriterAnimatedText(
                    textStyle: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    chatMessages[index]['msg'].toString(),
                  )
                ],
              ),
            ),
          );
        }
        return result;
      }),
      itemCount: chatMessages.length,
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:chat_gpt_clone/provider/chat_data.dart';
import 'package:chat_gpt_clone/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({super.key});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  TextEditingController? textEditingController;
  bool isTyping = false;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var obj = context.read<ChatData>();
    return Column(
      children: [
        Container(
          child: isTyping
              ? SpinKitThreeBounce(
                  color: Colors.white,
                  size: 18,
                )
              : Text(""),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10.0, bottom: 20.0, right: 20.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: const Color(0xFF40414f),
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: TextFormField(
            toolbarOptions: ToolbarOptions(
              copy: true,
              cut: true,
              paste: true,
              selectAll: true,
            ),
            controller: textEditingController,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              hintText: "Enter your message",
              suffixIcon: IconButton(
                onPressed: () async {
                  setState(() {
                    isTyping = true;
                  });
                  obj.addMessages({
                    'chatIndex': 0,
                    'msg': textEditingController?.text,
                  });
                  Map<String, dynamic> response = await ApiService()
                      .getDataFromOpenAI(textEditingController!.text);
                  obj.addMessages({
                    "chatIndex": 1,
                    "msg": response['choices'][0]['text'],
                  });
                  setState(() {
                    isTyping = false;
                  });
                },
                icon: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

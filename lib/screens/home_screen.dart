// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:chat_gpt_clone/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/chat_convo.dart';
import '../components/my_text_field.dart';
import '../provider/chat_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => ChatData()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Chat GPT"),
        ),
        drawer: const MyDrawer(),
        body: Column(
          children: [
            Flexible(
              child: ChatConvo(),
            ),
            Row(
              children: [
                Expanded(
                  child: MyTextField(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

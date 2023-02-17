import 'package:chat_gpt_clone/provider/chat_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var obj = context.read<ChatData>();
    return Drawer(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 500.0),
            child: TextButton.icon(
              label: Text(
                "Delete Conversation",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                obj.deleteMessages();
              },
              icon: Icon(
                Icons.delete_forever,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

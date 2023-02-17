import 'package:flutter/material.dart';

class ChatData extends ChangeNotifier {
  List<Map> chatMessages = [];

  void addMessages(Map data) {
    chatMessages.add(data);
    notifyListeners();
  }

  void deleteMessages() {
    chatMessages.clear();
    notifyListeners();
  }
}

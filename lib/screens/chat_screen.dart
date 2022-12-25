import 'package:doctors_connect/providers/chats_provider.dart';

import '../widgets/chat_list.dart';
import '../widgets/new_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = "/chat-screen";
  @override
  Widget build(BuildContext context) {
    final chatWith = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          chatWith['character'] == "bot" ? "Docbot Chat" : chatWith['name'],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink[100],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ChangeNotifierProvider(
        create: (_) => ChatsProvider(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ChatList(),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}

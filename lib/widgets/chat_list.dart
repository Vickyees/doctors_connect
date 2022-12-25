import 'package:doctors_connect/providers/chats_provider.dart';
import 'package:doctors_connect/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final messages = Provider.of<ChatsProvider>(context).chats;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (ctx, i) => MessageBubble(
            messages[i].text,
            messages[i].createdAt,
            messages[i].isMe,
          ),
        ),
      ),
    );
  }
}

import '../providers/chats_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewMessage extends StatefulWidget {
  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _messageController = TextEditingController();

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      FocusScope.of(context).unfocus();
      Provider.of<ChatsProvider>(context, listen: false)
          .addChat(_messageController.text.trim());

      _messageController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              autofocus: false,
              decoration: const InputDecoration(labelText: "Type a message..."),
              onSubmitted: (value) {
                _sendMessage();
              },
            ),
          ),
          CircleAvatar(
              child: IconButton(
            onPressed: () {
              _sendMessage();
            },
            icon: const Icon(Icons.send),
            iconSize: 22,
          ))
        ],
      ),
    );
  }
}

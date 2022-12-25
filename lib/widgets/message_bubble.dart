import 'package:flutter/material.dart';
import '../models/message.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final DateTime createdAt;
  final bool isMe;
  MessageBubble(this.text, this.createdAt, this.isMe);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: isMe
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    )
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
              color: isMe
                  ? Colors.deepPurple[300]
                  : Color.fromARGB(255, 225, 223, 223),
            ),
            constraints: BoxConstraints(maxWidth: 300),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 18, color: isMe ? Colors.white : Colors.black87),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

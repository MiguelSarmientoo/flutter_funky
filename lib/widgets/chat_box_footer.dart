import 'package:flutter/material.dart';

class ChatBoxFooter extends StatelessWidget {
  final TextEditingController textEditingController;
  final VoidCallback onSendMessage;

  ChatBoxFooter({
    required this.textEditingController,
    required this.onSendMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: () {
              // Implementar lógica para adjuntar archivos
            },
          ),
          Expanded(
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter your message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: onSendMessage,
          ),
        ],
      ),
    );
  }
}

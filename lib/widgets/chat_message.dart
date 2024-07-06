import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final String time;
  final bool isUser;

  ChatMessage({
    required this.message,
    required this.time,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue[100] : Colors.grey[300],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              message,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 5.0),
            Text(
              time,
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

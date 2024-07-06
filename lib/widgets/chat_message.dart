import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final String time;
  final int userType;

  ChatMessage({
    required this.message,
    required this.time,
    required this.userType, 
  });

  @override
  Widget build(BuildContext context) {
    bool isUser1 = userType == 1; 

    return Column(
      crossAxisAlignment: isUser1 ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (isUser1)
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Text(
              'You',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        Align(
          alignment: isUser1 ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(
              top: 8.0,
              bottom: 4.0,
              left: isUser1 ? 80.0 : 4.0, 
              right: isUser1 ? 4.0 : 80.0,
            ),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isUser1 ? Colors.blue[100] : Colors.grey[300],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  message,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 5.0),
                Text(
                  time,
                  textAlign: TextAlign.right, 
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

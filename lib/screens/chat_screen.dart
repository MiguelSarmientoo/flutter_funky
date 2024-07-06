import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
import 'package:flutter_funky/widgets/chat_message.dart'; 

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, dynamic>> messages = []; 

  void _sendMessage(String text) {
    setState(() {
      messages.add({
        'id': UniqueKey().toString(), 
        'text': text,
        'time': DateFormat('HH:mm').format(DateTime.now()), 
        'isUser': true, 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ChatMessage(
                  message: messages[index]['text'],
                  time: messages[index]['time'],
                  isUser: messages[index]['isUser'],
                );
              },
            ),
          ),
          ChatBoxFooter(
            onSendMessage: _sendMessage,
          ),
        ],
      ),
    );
  }
}

class ChatBoxFooter extends StatelessWidget {
  final Function(String) onSendMessage;

  ChatBoxFooter({required this.onSendMessage});

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.grey[200],
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              String message = _controller.text.trim();
              if (message.isNotEmpty) {
                onSendMessage(message);
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}

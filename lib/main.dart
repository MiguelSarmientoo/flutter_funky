import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Para formateo de fechas

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = []; // Lista para almacenar los mensajes
  final TextEditingController _controller = TextEditingController();

  void _addMessage(String text) {
    setState(() {
      _messages.add(Message(
        id: DateTime.now().toString(),
        text: text,
        time: DateFormat('HH:mm').format(DateTime.now()),
      ));
    });
    _controller.clear(); // Limpiar el TextField después de enviar el mensaje
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (ctx, index) => ChatMessage(_messages[index]),
            ),
          ),
          _buildChatInput(),
        ],
      ),
    );
  }

  Widget _buildChatInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enviar mensaje...'),
              onSubmitted: (value) {
                _addMessage(value);
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                _addMessage(_controller.text);
              }
            },
          ),
        ],
      ),
    );
  }
}

class Message {
  final String id;
  final String text;
  final String time;

  Message({
    required this.id,
    required this.text,
    required this.time,
  });
}

class ChatMessage extends StatelessWidget {
  final Message message;

  ChatMessage(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(child: Text('User')),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.text,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                message.time,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_funky/widgets/chat_message.dart';
import 'package:flutter_funky/widgets/chat_box_footer.dart';

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

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/logo_funcy_scale.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Funcy IA',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Online',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                int userType = messages[index]['userType'] ?? 1; // Por defecto, userType es 1 si no está definido

                return ChatMessage(
                  message: messages[index]['text'],
                  time: messages[index]['time'],
                  userType: userType, 
                );
              },
            ),
          ),
          ChatBoxFooter(
            textEditingController: _controller,
            onSendMessage: _sendMessage,
          ),
        ],
      ),
    );
  }
}

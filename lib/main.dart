import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isChatBoxVisible = false;
  bool _isModalVisible = false;

  void _toggleChatBoxVisibility() {
    setState(() {
      _isChatBoxVisible = !_isChatBoxVisible;
    });
  }

  void _toggleModalVisibility() {
    setState(() {
      _isModalVisible = !_isModalVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: _toggleChatBoxVisibility,
              child: Icon(Icons.chat),
            ),
          ),
          if (_isChatBoxVisible)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 400,
                color: Colors.white,
                child: Column(
                  children: [
                    ChatBoxHeader(onClose: _toggleChatBoxVisibility),
                    Expanded(child: ChatBoxBody()),
                    ChatBoxFooter(onAddExtra: _toggleModalVisibility),
                  ],
                ),
              ),
            ),
          if (_isModalVisible)
            Modal(onClose: _toggleModalVisibility),
        ],
      ),
    );
  }
}

class ChatBoxHeader extends StatelessWidget {
  final VoidCallback onClose;

  ChatBoxHeader({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: onClose,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage('https://fnldigital.com/wp-content/uploads/2024/04/Diseno-sin-titulo-9.png'),
          ),
          SizedBox(width: 8.0),
          Text(
            'Funcy ia assistant',
            style: TextStyle(color: Colors.white),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: onClose,
          ),
        ],
      ),
    );
  }
}

class ChatBoxBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: [
        ChatMessage(
          isUser: true,
          message: 'Me gustaria tener tu apoyo',
          time: '12:00',
        ),
        ChatMessage(
          isUser: false,
          message: 'Lamento escuchar tu situacion entiendo que necesites apoyo. Te recomiendo este contenido',
          time: '12:00',
        ),
        ChatMessage(
          isUser: false,
          message: 'Te recomiendo este contenido',
          time: '12:00',
        ),
        ChatMessage(
          isUser: false,
          message: '',
          time: '12:00',
          icon: FontAwesomeIcons.fileAlt,
        ),
        ChatMessage(
          isUser: true,
          message: 'Muchas gracias',
          time: '12:00',
        ),
      ],
    );
  }
}

class ChatMessage extends StatelessWidget {
  final bool isUser;
  final String message;
  final String time;
  final IconData? icon;

  ChatMessage({
    required this.isUser,
    required this.message,
    required this.time,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue[100] : Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (icon != null)
              Icon(icon, size: 50.0),
            if (message.isNotEmpty)
              Text(message),
            SizedBox(height: 5.0),
            Text(
              time,
              style: TextStyle(fontSize: 10.0, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBoxFooter extends StatelessWidget {
  final VoidCallback onAddExtra;

  ChatBoxFooter({required this.onAddExtra});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: onAddExtra,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Your Message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class Modal extends StatelessWidget {
  final VoidCallback onClose;

  Modal({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose,
      child: Container(
        color: Colors.black54,
        child: Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Escribe tu mensaje', style: TextStyle(fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: onClose,
                      ),
                    ],
                  ),
                  // Agrega los elementos de tu modal aquí
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

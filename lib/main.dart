import 'package:flutter/material.dart';

void main() {
  runApp(MyAI());
}

class MyAI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AIHome(),
    );
  }
}

class AIHome extends StatefulWidget {
  @override
  _AIHomeState createState() => _AIHomeState();
}

class _AIHomeState extends State<AIHome> {
  TextEditingController controller = TextEditingController();
  List<String> chat = [];

  String getReply(String text) {
    text = text.toLowerCase();

    if (text.contains("hi")) {
      return "Hello 😏 kya haal hai?";
    } else if (text.contains("name")) {
      return "Main tumhari AI hoon 😎";
    } else {
      return "Interesting 😏 aur bolo";
    }
  }

  void sendMessage() {
    String text = controller.text;
    if (text.isEmpty) return;

    setState(() {
      chat.add("You: $text");
      chat.add("AI: ${getReply(text)}");
    });

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Owaiyo AI 😏")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chat.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(chat[index]),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Type message...",
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: sendMessage,
              )
            ],
          )
        ],
      ),
    );
  }
}

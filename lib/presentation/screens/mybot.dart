import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:graduation/app/app_colors.dart';
import 'package:http/http.dart' as http;

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  ChatUser muself = ChatUser(id: "1", firstName: "SHARJEEL");
  ChatUser bot = ChatUser(id: "2", firstName: "Chat GPT");
  List<ChatMessage> allMassages = [];
  List<ChatUser> typing = [];

  final ourUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyDEpQHEmYfFdd1aQOnhHUGpX6dByl0-ZKI";
  final header = {'Content-Type': 'application/json'};

  getData(ChatMessage m) async {
    typing.add(bot);
    allMassages.insert(0, m);
    setState(() {});
    var data = {
      "contents": [
        {
          "parts": [
            {"text": m.text}
          ]
        }
      ]
    };

    await http
        .post(Uri.parse(ourUrl), headers: header, body: jsonEncode(data))
        .then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);
        print(result["candidates"][0]["content"]["parts"][0]["text"]);
        ChatMessage m1 = ChatMessage(
          user: bot,
          createdAt: DateTime.now(),
          text: result["candidates"][0]["content"]["parts"][0]["text"],
        );
        allMassages.insert(0, m1);
      } else {
        print("Error occurred");
      }
    }).catchError((e) {});
    typing.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            children: [
              Image.asset(
                "assets/images/chat.png",
                height: 32,
                width: 20,
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    "ChatBot",
                    style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: AppColors.buttonColor),
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle, size: 9, color: Color(0xff027100)),
                      SizedBox(width: 6),
                      Text(
                        "Online",
                        style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff027100)),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: DashChat(
        messageOptions: MessageOptions(
            showTime: true,
            textColor: Colors.white,
            containerColor: AppColors.buttonColor),
        typingUsers: typing,
        currentUser: muself,
        onSend: (ChatMessage m) {
          getData(m);
        },
        messages: allMassages,
      ),
    );
  }
}

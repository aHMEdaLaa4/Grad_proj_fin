import 'package:flutter/material.dart';
import 'package:graduation/presentation/aml/chats/aboutus.dart';
import 'package:graduation/presentation/aml/home/Home.dart';

// chaaaaaaaaaaaattttttttttt

class chat extends StatefulWidget {
  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     "",
        //     style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.bold),
        //   ),
        //   backgroundColor: Color.fromRGBO(239, 241, 241, 0.965),
        //   centerTitle: true,
        // ),
        body: Container(
      color: Color.fromRGBO(239, 241, 241, 0.965),
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, bottom: 10, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "community",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.settings,
                  size: 25,
                )
              ],
            ),
          ),
          Container(
            height: 58,
            padding: EdgeInsets.all(5),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                  labelText: "Let's share your results ",
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: Icon(
                    Icons.search,
                  )),
            ),
          ),
          chatListtile(
              name: "Sara",
              email: "What's your opinion?",
              date: "08:39",
              imagename: "image1 (1).jpg"),
          chatListtile(
              name: "Nada",
              email: "How are you?",
              date: "07:30",
              imagename: "image1 (2).jpg"),
          chatListtile(
              name: "Eman",
              email: "Hi, i am share my task with you",
              date: "07:00",
              imagename: "image1 (3).jpg"),
          chatListtile(
              name: "Yasmin",
              email: "I wish you are fine",
              date: "06:30",
              imagename: "image1 (4).jpg"),
          chatListtile(
              name: "Hend",
              email: "i'm did my math homework",
              date: "06:01",
              imagename: "image1 (9).jpg"),
          chatListtile(
              name: "Yara",
              email: "i am ganna have a breake",
              date: "05:30",
              imagename: "image1 (6).jpg"),
          chatListtile(
              name: "Laila",
              email: "No, i am watcing toutube",
              date: "05:00",
              imagename: "image1 (7).jpg"),
          chatListtile(
              name: "Nada",
              email: "No, i am watcing toutube",
              date: "05:00",
              imagename: "image1 (8).jpg"),
          chatListtile(
              name: "Ahlam",
              email: "No, i am watcing toutube",
              date: "05:00",
              imagename: "image1 (9).jpg"),
        ],
        // )
      ),
    ));
  }
}

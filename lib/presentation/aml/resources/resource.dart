import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class resource extends StatefulWidget {
  const resource({super.key});
  @override
  State<resource> createState() => _resourceState();
}

int index = 0;

List _photos = [
  Data(
      image: 'assets/images/b593eeff439a9720bfdbbcd8c1b31f30 1.png',
      title: 'Math Book - Grade 1'),
  Data(image: 'assets/images/book2.png', title: 'Science Book -Grade 1'),
  Data(image: 'assets/images/image1 (10).jpg', title: 'Arabic Book - Grade 1'),
  Data(image: 'assets/images/image1 (11).jpg', title: 'English Book - Grade 1'),
  Data(image: 'assets/images/6.png', title: 'Math Book - Grade 2'),
  Data(image: 'assets/images/book1.png', title: 'Math Book - Grade 2'),
  Data(image: 'assets/images/image1 (10).jpg', title: 'Arabic Book - Grade 2'),
  Data(image: 'assets/images/image1 (11).jpg', title: 'English Book - Grade 2'),
  Data(image: 'assets/images/book1.png', title: 'Math Book - Grade 3'),
  Data(image: 'assets/images/image1 (10).jpg', title: 'Arabic Book - Grade 3'),
  Data(image: 'assets/images/6.png', title: 'Math Book - Grade 3'),
];

class _resourceState extends State<resource> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        color: Color.fromARGB(255, 238, 243, 246),
        padding: EdgeInsets.all(18),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Educational Resources",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  FaIcon(
                    FontAwesomeIcons.book,
                    size: 26,
                  )
                ],
              ),
            ),
            Container(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 250,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemCount: _photos.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 239, 234, 234),
                        borderRadius: BorderRadius.circular(5)),
                    child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  width: 450,
                                  height: 370,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Some Information about this Book: ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 8, bottom: 8),
                                          child: Text(
                                            " Abstract : ",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            "Embark on an exciting journey into the world of reading with Adventures in Reading: A Third Grade Expedition. This engaging English book for third graders introduces young learners to a diverse array of literary genres, from captivating tales of adventure and fantasy to heartwarming stories of friendship and self-discovery. Through engaging text, colorful illustrations, and thought-provoking discussion prompts, students embark on a literary adventure, exploring the power of stories to transport them to different worlds, ignite their imaginations, and connect them to the human experience.",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey),
                                          ),
                                        ),
                                        Text(
                                          "You can download this book from that link :",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              "https://www.mlzamty.com/review-english-third-primary/",
                                              style: TextStyle(fontSize: 10),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 238, 238, 238),
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(_photos[index].image),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                child: Text(
                              _photos[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )),

////////////////////////////////////////////////////////////////
                            ///
                            ///
                          ],
                        )),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }

  void _changeItem(int value) {
    print(value);
    setState(() {
      index = value;
    });
  }
}

////////////////////////////////////////////////////////////////
class Data {
  String image;
  String title;

  Data({required this.image, required this.title});
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation/Cache/local_network.dart';
import 'package:graduation/presentation/aml/profile.dart/analytics.dart';
import 'package:graduation/presentation/aml/profile.dart/appointment.dart';
import 'package:graduation/presentation/aml/profile.dart/doctors.dart';
import 'package:graduation/presentation/aml/profile.dart/meeting.dart';
import 'package:graduation/presentation/aml/profile.dart/tips.dart';
import 'package:graduation/presentation/screens/VideoCall/callscreen.dart';
import 'package:graduation/presentation/screens/loginDoctor/login_doc.dart';

import '../../screens/log_in.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 238, 243, 246),
        padding: EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            Center(
                child: Text(
              "User Profile",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            )),
            Container(
              padding: EdgeInsets.only(top: 10),
              width: 100,
              height: 100,
              child: Center(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/images/image1 (2).jpg"),
              )),
            ),
            Container(
              child: Center(
                  child: Text(
                "${CacheNetwork.getCacheData(key: 'name')}",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )),
            ),
            Center(
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  )),
            ),
            ////////////////////////////////////////////////////////////////////////

            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => doctors()),
                );
              },
              child: Container(
                margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Container(
                        child: Expanded(
                            child: ListTile(
                      leading: Icon(
                        Icons.rate_review_outlined,
                        color: Color.fromARGB(255, 62, 123, 173),
                      ),
                      title: Text(
                        "Review about Doctors",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.chevron_right_outlined),
                    ))),
                  ],
                ),
              ),
            ),
            ////////////////////////////////////////////////////////////////////////////

            ////////////////////////////////////////////////////////////////////////////
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => callScreen()),
                );
              },
              child: Container(
                margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Container(
                        child: Expanded(
                            child: ListTile(
                      leading: Icon(
                        Icons.call,
                        color: Color.fromARGB(255, 62, 123, 173),
                      ),
                      title: Text(
                        "Join Meeting with doctor",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.chevron_right_outlined),
                    ))),
                  ],
                ),
              ),
            ),
            ////////////////////////////////////////////////////////////////////////////
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => analytics()),
                );
              },
              child: Container(
                margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Container(
                        child: Expanded(
                            child: ListTile(
                      leading: Icon(
                        FontAwesomeIcons.lineChart,
                        size: 22,
                        color: Color.fromARGB(255, 62, 123, 173),
                      ),
                      title: Text(
                        "My Analytics",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.chevron_right_outlined),
                    ))),
                  ],
                ),
              ),
            ),
            ////////////////////////////////////////////////////////////////////////////
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => tips()),
                );
              },
              child: Container(
                margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Container(
                        child: Expanded(
                            child: ListTile(
                      leading: Icon(
                        Icons.table_view_sharp,
                        color: Color.fromARGB(255, 62, 123, 173),
                      ),
                      title: Text(
                        "Tips for dealing with ADHD",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.chevron_right_outlined),
                    ))),
                  ],
                ),
              ),
            ),
            ////////////////////////////////////////////////////////////////////////////
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LOGIN(),
                    ));
              },
              child: Container(
                margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Container(
                        child: Expanded(
                            child: ListTile(
                      leading: Icon(
                        FontAwesomeIcons.signOut,
                        size: 21,
                        color: Color.fromARGB(255, 62, 123, 173),
                      ),
                      title: Text(
                        "Log Out",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.chevron_right_outlined),
                    ))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

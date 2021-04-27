import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vendor_enema_app/add_new_movie.dart';
import 'package:vendor_enema_app/view_all_movies.dart';

import 'notifications.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var notilenth = FirebaseFirestore.instance
        .collection('Notifications')
        .orderBy('id')
        .snapshots()
        .length;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://i.pinimg.com/564x/5a/8e/65/5a8e65dafcfdcdc68f0e70d47fd2d47e.jpg'),
              fit: BoxFit.fill),
        ),
        child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: new Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
            child: ListView(children: [
              Column(
                children: [
                  SizedBox(
                    width: 10,
                    height: 30,
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome ',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        ' Home page  ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  SizedBox(
                    width: 10,
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Addmovie()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        width: _width / 2,
                        height: _height / 4,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Icon(
                              Icons.movie,
                              size: _width / 3,
                              color: Colors.white,
                            ),
                            Text(
                              'Add new movie',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  /////////////////////////////////////////2
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new MovieMain()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        width: _width / 2,
                        height: _height / 4,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Icon(
                              Icons.grid_view,
                              size: _width / 3,
                              color: Colors.white,
                            ),
                            Text(
                              'View & Edit',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ////////////////////////////////////3
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Notifications()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        width: _width / 2,
                        height: _height / 4,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Stack(children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.mail_outline_rounded,
                                    size: _width / 3,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Navigations',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
///////////////////////////////

                              StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('Notifications')
                                      .orderBy('id')
                                      .snapshots(),
                                  builder: (context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 80),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15, left: 16),
                                            child: Text(
                                                '${snapshot.data.docs.length}',
                                                style:
                                                    TextStyle(fontSize: 15))),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(500),
                                          color: Colors.red,
                                        ),
                                      ),
                                    );
                                  }),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

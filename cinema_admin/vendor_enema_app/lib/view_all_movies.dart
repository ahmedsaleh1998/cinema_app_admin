import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vendor_enema_app/Editpage.dart';
import 'package:vendor_enema_app/film_model.dart';
import 'package:vendor_enema_app/viewmovie.dart';

class MovieMain extends StatefulWidget {
  @override
  _MovieMainState createState() => _MovieMainState();
}

class _MovieMainState extends State<MovieMain> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Film sentfilm;
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 73, 83, 1.0),
        appBar: AppBar(
          title: Text('Movies'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(16, 42, 48, 0),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/cinema-app-247f8.appspot.com/o/image_picker2631741982909539820.jpg?alt=media&token=8baf6b1a-7f47-4c21-9f59-2486fd8ffb87'),
                    fit: BoxFit.fill)),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
              child: StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance.collection('Film').snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1),
                        itemCount:
                            snapshot.hasData ? snapshot.data.docs.length : 0,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Viewmovie(),
                                    settings: RouteSettings(
                                      arguments: Viewmovie(
                                        id: snapshot.data.docs[index]
                                            .data()['id'],
                                        image: snapshot.data.docs[index]
                                            .data()['movie_image'],
                                        catigory: snapshot.data.docs[index]
                                            .data()['catigory'],
                                        description: snapshot.data.docs[index]
                                            .data()['description'],
                                        time: snapshot.data.docs[index]
                                            .data()['time'],
                                        title: snapshot.data.docs[index]
                                            .data()['title'],
                                        numberofchairs: snapshot
                                            .data.docs[index]
                                            .data()['numberofchairs'],
                                      ),
                                    )),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 50, right: 50, top: 5, bottom: 5),
                              child: Column(
                                children: [
                                  Container(
                                    width: width / 1.1,
                                    height: height / 3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.amber[100],
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: (snapshot.data.docs[index]
                                                      .data()["movie_image"] ==
                                                  null)
                                              ? NetworkImage(
                                                  'https://i.pinimg.com/564x/ce/1d/7b/ce1d7ba6e00ff07eb0db23efc5467147.jpg')
                                              : NetworkImage(snapshot
                                                  .data.docs[index]
                                                  .data()['movie_image']),
                                        )),
                                    margin: EdgeInsets.all(5),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width: width / 2.9,
                                        child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Viewmovie(),
                                                    settings: RouteSettings(
                                                      arguments: Viewmovie(
                                                        id: snapshot
                                                            .data.docs[index]
                                                            .data()['id'],
                                                        image: snapshot.data
                                                                .docs[index]
                                                                .data()[
                                                            'movie_image'],
                                                        catigory: snapshot
                                                            .data.docs[index]
                                                            .data()['catigory'],
                                                        description: snapshot
                                                                .data
                                                                .docs[index]
                                                                .data()[
                                                            'description'],
                                                        time: snapshot
                                                            .data.docs[index]
                                                            .data()['time'],
                                                        title: snapshot
                                                            .data.docs[index]
                                                            .data()['title'],
                                                        numberofchairs: snapshot
                                                                .data
                                                                .docs[index]
                                                                .data()[
                                                            'numberofchairs'],
                                                      ),
                                                    )),
                                              );
                                            },
                                            child: Text('View')),
                                      ),
                                      SizedBox(
                                        width: width / 2.9,
                                        child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Editmovie(),
                                                    settings: RouteSettings(
                                                      arguments: Editmovie(
                                                        id: snapshot
                                                            .data.docs[index]
                                                            .data()['id'],
                                                        image: snapshot.data
                                                                .docs[index]
                                                                .data()[
                                                            'movie_image'],
                                                        catigory: snapshot
                                                            .data.docs[index]
                                                            .data()['catigory'],
                                                        description: snapshot
                                                                .data
                                                                .docs[index]
                                                                .data()[
                                                            'description'],
                                                        time: snapshot
                                                            .data.docs[index]
                                                            .data()['time'],
                                                        title: snapshot
                                                            .data.docs[index]
                                                            .data()['title'],
                                                        numberofchairs: snapshot
                                                                .data
                                                                .docs[index]
                                                                .data()[
                                                            'numberofchairs'],
                                                      ),
                                                    )),
                                              );
                                            },
                                            child: Text('Edit')),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }),
            )));
  }
}

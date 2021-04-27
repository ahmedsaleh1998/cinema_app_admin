import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vendor_enema_app/Editpage.dart';
import 'package:vendor_enema_app/film_model.dart';

class Viewmovie extends StatefulWidget {
  String id;
  String title;
  String description;
  String time;
  String image;
  int numberofchairs;
  String catigory;
  Viewmovie({
    this.title,
    this.description,
    this.catigory,
    this.image,
    this.time,
    this.id,
    this.numberofchairs,
  });
  @override
  _ViewmovieState createState() => _ViewmovieState();
}

class _ViewmovieState extends State<Viewmovie> {
  @override
  Widget build(BuildContext context) {
    var width1 = MediaQuery.of(context).size.width;
    Viewmovie all = ModalRoute.of(context).settings.arguments;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color.fromRGBO(0, 81, 93, 1),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(children: [
              Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amber[100],
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: (all.image == null)
                              ? AssetImage('assets/images/a3.png')
                              : NetworkImage(all.image),
                        )),
                  ),
                ),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          all.title,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        all.time,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red[300],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(217, 154, 140, 0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromRGBO(155, 155, 155, 0.5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(
                              all.description,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ],
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width1 / 3,
                        height: 50,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                          child: Text(
                            ' valed chairs = ${all.numberofchairs}',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width1 / 3,
                        height: 50,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red,
                          ),
                          child: Text(
                              ' unvaled chairs = ${47 - all.numberofchairs}',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  ),
                ),
                ///////////////////
                SizedBox(
                  width: width1 / 1.1,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.red[300],
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Editmovie(),
                              settings: RouteSettings(
                                arguments: Editmovie(
                                  id: all.id,
                                  image: all.image,
                                  catigory: all.catigory,
                                  description: all.description,
                                  time: all.time,
                                  title: all.title,
                                  numberofchairs: all.numberofchairs,
                                ),
                              )));
                    },
                    child: Text(
                      'Edit',
                      style: TextStyle(fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ]),
            ]),
          ),
        ));
  }
}

import 'dart:io';
import 'dart:ui';
import 'package:path/path.dart' as p;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_enema_app/film_model.dart';

class Editmovie extends StatefulWidget {
  String id;
  String title;
  String description;
  String time;
  String image;
  int numberofchairs;
  String catigory;
  Editmovie({
    this.title,
    this.description,
    this.catigory,
    this.image,
    this.time,
    this.id,
    this.numberofchairs,
  });
  @override
  _EditmovieState createState() => _EditmovieState();
}

class _EditmovieState extends State<Editmovie> {
  final _formKey = GlobalKey<FormState>();
  final _scafoldkey = GlobalKey<ScaffoldState>();
  File _image;
  Film movie = new Film();
  String _imageurl;

  TextEditingController _filmtitle = TextEditingController();
  TextEditingController _fildescription = TextEditingController();
  TextEditingController _filmetime = TextEditingController();
  TextEditingController _filmnumberofchairs = TextEditingController();
  TextEditingController _filmcategory = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width1 = MediaQuery.of(context).size.width;
    Editmovie all = ModalRoute.of(context).settings.arguments;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scafoldkey,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://static.wikia.nocookie.net/despicableme/images/4/46/Vector_wallpaper.jpeg/revision/latest/scale-to-width-down/340?cb=20160515045329'),
                fit: BoxFit.fill),
          ),
          child: new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
            child: ListView(
              children: [
                Form(
                  key: _formKey,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 10,
                          height: 30,
                        ),
                        Text(
                          'Edit Movie ',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                          height: 30,
                        ),
                        ///////////////////////////second movie title  222
                        SizedBox(
                            width: width1 / 1.1,
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              controller: _filmtitle,
                              onChanged: (value) {
                                setState(() {
                                  movie.title = _filmtitle.text;
                                });
                              },
                              decoration: InputDecoration(
                                  hintText: 'Movie title',
                                  prefixIcon: Icon(
                                    Icons.movie_creation,
                                    color: Colors.blue,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50))),
                            )),
                        SizedBox(
                          width: 10,
                          height: 30,
                        ),
                        ///////////////////////////therd movie title
                        SizedBox(
                            width: width1 / 1.1,
                            child: TextFormField(
                              controller: _fildescription,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  movie.description = _fildescription.text;
                                });
                              },
                              decoration: InputDecoration(
                                  hintText: 'Movie description',
                                  prefixIcon: Icon(
                                    Icons.design_services,
                                    color: Colors.blue,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50))),
                            )),
                        SizedBox(
                          width: 10,
                          height: 30,
                        ),

                        Padding(
                          padding: EdgeInsets.only(right: width1 / 1.89),
                          child: SizedBox(
                            width: width1 / 2.5,
                            height: width1 / 7,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Choose image source !!'),
                                        actions: [
                                          RaisedButton(
                                            onPressed: () {
                                              getImagecamera();
                                              uploadFile();

                                              setState(() {
                                                movie.image = _imageurl;
                                              });
                                            },
                                            child: Text('Camera'),
                                          ),
                                          RaisedButton(
                                            onPressed: () {
                                              getImageGallery();
                                              uploadFile();
                                              setState(() {
                                                movie.image = _imageurl;
                                              });
                                            },
                                            child: Text('Gallery'),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: Text(
                                ' + Movie Image',
                                style: TextStyle(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                          height: 30,
                        ),
                        ///////////////////////////forth movie title
                        SizedBox(
                            width: width1 / 1.1,
                            child: TextFormField(
                              controller: _filmcategory,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  movie.catigory = _filmcategory.text;
                                });
                              },
                              decoration: InputDecoration(
                                  hintText: 'Movie catigory',
                                  prefixIcon: Icon(
                                    Icons.category_outlined,
                                    color: Colors.blue,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50))),
                            )),
                        SizedBox(
                          width: 10,
                          height: 30,
                        ),
                        ///////////////////////////fifth movie title
                        SizedBox(
                            width: width1 / 1.1,
                            child: TextFormField(
                              controller: _filmetime,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  movie.time = _filmetime.text;
                                });
                              },
                              decoration: InputDecoration(
                                  hintText: 'Movie time',
                                  prefixIcon: Icon(
                                    Icons.timelapse_outlined,
                                    color: Colors.blue,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50))),
                            )),
                        SizedBox(
                          width: 10,
                          height: 30,
                        ),
                        ///////////////////////////six movie title
                        ///////////////////////////first movie title
                        SizedBox(
                            width: width1 / 1.1,
                            child: TextFormField(
                              controller: _filmnumberofchairs,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  movie.numberofchairs =
                                      int.parse(_filmnumberofchairs.text);
                                });
                              },
                              decoration: InputDecoration(
                                  hintText: 'Number of chairs',
                                  prefixIcon: Icon(
                                    Icons.sports_golf_sharp,
                                    color: Colors.blue,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50))),
                            )),
                        SizedBox(
                          width: 10,
                          height: 30,
                        ),
                        SizedBox(
                          width: width1 / 1.5,
                          height: width1 / 7,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                movie.id = all.id;
                                setdatatofirebase(movie);
                                _scafoldkey.currentState.showSnackBar(
                                    SnackBar(content: Text('Processing Data')));
                                Navigator.of(context).pop();
                              }
                            },
                            child: (Text(
                              'add movie',
                              style: TextStyle(fontSize: 20),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getImageGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });

    Navigator.of(context).pop();
  }

  Future getImagecamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
    Navigator.of(context).pop();
  }

  Future uploadFile() async {
    Reference storageReference =
        FirebaseStorage.instance.ref().child(p.basename(_image.path));
    UploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.whenComplete(() {
      Fluttertoast.showToast(
          msg: 'image uploaded successfuly!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          fontSize: 15);
    });
    storageReference.getDownloadURL().then((fileURL) {
      Fluttertoast.showToast(
          msg: 'image url ready successfuly!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          fontSize: 15);

      setState(() {
        movie.image = fileURL;
      });
    });
  }

  void setdatatofirebase(Film movie) {
    DocumentReference ref =
        FirebaseFirestore.instance.collection("Film").doc(movie.id);
    ref.set({
      'title': movie.title,
      'description': movie.description,
      'time': movie.time,
      'numberofchairs': movie.numberofchairs,
      'catigory': movie.catigory,
      'movie_image': movie.image,
      'id': ref.id,
    });
  }
}

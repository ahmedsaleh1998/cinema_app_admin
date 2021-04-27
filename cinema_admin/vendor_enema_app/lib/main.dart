import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:vendor_enema_app/homepage.dart';
import 'dart:ui';

import 'package:animated_splash_screen/animated_splash_screen.dart';

main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  return runApp(MyApp());
}

///////////////////stf widget for main page ////////////
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: Image.asset('asset/0100.gif'),
          splashIconSize: 250,
          backgroundColor: Colors.white,
          nextScreen: Homepage(),
        ));
  }
}

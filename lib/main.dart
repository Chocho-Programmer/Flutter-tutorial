import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/choose_location.dart';
import 'pages/loading.dart';
import './notes/test.dart';

void main() => runApp(MaterialApp(
  // home: Home(),
  initialRoute: '/test',
  routes: {
    '/test': (context) => Test(),
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  }
));

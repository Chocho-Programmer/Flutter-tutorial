import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {

  String time = '';
  String datetime = '';

  Future<void> fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London'));
      Map data = jsonDecode(response.body);
      datetime = data['datetime'];
      print(datetime);
    } catch(e) {
      print('Error occured: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: EdgeInsets.all(50.0),
        child: Text('The time is: $datetime'),
      ),
    );
  }
}

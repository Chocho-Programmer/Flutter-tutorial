import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void getData() async {
  // get response on load on this page
  http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  // to change the data from string to object
  Map data = jsonDecode(response.body);
}


// request time url
Future<void> getTime() async {
  try {
    // to get the data from api
    http.Response response = await http.get(Uri.parse('https://worldtimeapi.org/api/timezone/'));
    // to convert it to json from string
    Map data = jsonDecode(response.body);
    print(data);

    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3); // substring is slice() in js

    // create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

  } catch (e) {
    print('error occured: $e');
  }
}

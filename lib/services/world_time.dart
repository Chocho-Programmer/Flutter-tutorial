import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = '';
  String flag;
  String url; // location for url
  bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url, required this.isDaytime});

  Future<void> getTime() async {
    try {
      // to get the data from api
      http.Response response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      // to convert it to json from string
      Map data = jsonDecode(response.body);
      // print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3); // substring is slice() in js

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));


      // to set day or night tie
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;

      // time = now.toString();
      time = DateFormat.jm().format(now);
      // print(time);
    } catch (e) {
      time = 'could not get time data';
    }
  }
}

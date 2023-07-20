import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:intl/intl_browser.dart';

class WorldTime {
  String location;
  String time = '';
  String flag;
  String url; // location for url

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // to get the data from api
      http.Response response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      // to convert it to json from string
      Map data = jsonDecode(response.body);
      print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3); // substring is slice() in js

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = now.toString();
      print(time);
    } catch (e) {
      print('error occured: $e');
      time = 'could not get time data';
    }
  }
}

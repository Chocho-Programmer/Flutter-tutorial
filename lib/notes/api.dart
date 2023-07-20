import 'package:http/http.dart' as http;
import 'dart:convert';

void getData() async {
  // get response on load on this page
  http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  // to change the data from string to object
  Map data = jsonDecode(response.body);
  print(data);
}



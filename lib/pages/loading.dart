import 'package:flutter/material.dart';
import '../services/world_time.dart';
import '../pages/home.dart';

//ADD SOMETHING
class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // Initial state of the time
  String time = 'loading';

  Future<void> setUpWorldTime() async {
    // Awaits and gets the time of a location
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/London');
    await instance.getTime();

    // updates the time variable after getting the data
    setState(() {
      time = instance.time;
    });

    // Arguments to pass to the next page after loaded
    Object arguments = {
      'location': instance.location,
      'time': instance.time,
      'url': instance.url,
    };
    // Navigates to the next page after screen loaded
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(), settings: RouteSettings(arguments: arguments)));
  }

  // Run once after a hot restart, initial function of the page
  @override
  void initState() {
    // Runs other codes before the below, async
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
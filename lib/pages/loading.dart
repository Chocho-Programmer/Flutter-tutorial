import 'package:flutter/material.dart';
import '../services/world_time.dart';
import '../pages/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//ADD SOMETHING
class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // Initial state of the time
  String time = 'loading';

  Future<void> setUpWorldTime() async {
    // Awaits and gets the time of a location from world_time
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/London', isDaytime: true);
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
      'isDaytime': instance.isDaytime,
    };
    // print(instance.time);
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
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.black,
          size: 50.0,
        )
      )
    );
  }
}
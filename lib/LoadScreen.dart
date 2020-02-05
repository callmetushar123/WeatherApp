import 'package:demo/Location.dart';
import 'package:demo/MainScreen.dart';
import 'package:flutter/material.dart';
import 'Networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadScreen extends StatefulWidget {
  @override
  _LoadScreenState createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  var latitude;
  var longitude;

  Network net = Network();
  //Location loc = Location();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parseData();
  }

  void parseData() async {
//    await loc.getLocation();
//    latitude = loc.lat;
//    longitude = loc.lon;

    var data = await net.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MainScreen(curLocdata: data,);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Please wait...",
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             SpinKitWave(
              color: Colors.yellow,
              //duration: Duration(microseconds: 1200),
              size: 50,
            ),
            Container(
              child: Text(
                "OpenWeather",
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 30,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}

import 'package:demo/weather.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'Networking.dart';
import 'package:weather_icons/weather_icons.dart';
import 'Search.dart';

class MainScreen extends StatefulWidget {
  final curLocdata;
  MainScreen({this.curLocdata});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Weather weather = Weather();

  var cityName;
  int temp;
  int temp_min;
  int temp_max;
  Icon weatherIcon;
  String textSum;
  String st;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.curLocdata);
  }

  void updateUI(data) {
    setState(() {
      if (data == null) {
        temp = 0;
        cityName = '';
        textSum = 'Error in fetching data';
        weatherIcon = Icon(Icons.error);
        return;
      }
      cityName = data['name'];
      temp = data['main']['temp'].toInt();
      temp_min = data['main']['temp_min'].toInt();
      temp_max = data['main']['temp_max'].toInt();
      var condition = data['weather'][0]['id'];
      weatherIcon = weather.getIcon(condition);
      textSum = weather.getMessage(temp);
      st = weather.subtext(condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () async {
                        updateUI(await Network().getData());
                      },
                      child: Icon(
                        FontAwesomeIcons.locationArrow,
                      ),
                    ),
                    FlatButton(
                      onPressed: () async {
                        String SName = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Search();
                        }));
                        if (SName != null) {
                          updateUI(await Network().getDataName(
                              SName)); //didn't work because forgot to put await
                        }
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
//                margin: EdgeInsets.fromLTRB(0, 50, 260, 0),
                        child: Text(
                          cityName,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Source Sans Pro',
                          ),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                flex: 9,
                child: Container(
                  margin: EdgeInsets.fromLTRB(50, 30, 50, 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            '$temp°',
                            style: TextStyle(
                                fontSize: 80,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Source Sans Pro'),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            st,
                            style: TextStyle(
                                fontSize: 30, fontFamily: 'Source Sans Pro'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 50),
                        child: Container(
                          child: Text(
                            "$textSum in $cityName",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[500],
                                fontFamily: 'Source Sans Pro'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          //width: double.infinity,
                          //height: 100,
                          child: Divider(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 38),
                              child: Text(
                                '$temp_min°-$temp_max°',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey[500],
                                  fontFamily: 'Source Sans Pro',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 38),
                              //padding: const EdgeInsets.all(8.0),
                              child: weatherIcon,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF0C0C0C),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                //margin: EdgeInsets.only(bottom: 50),
                child: Text(
                  "Created by Tushar",
                  style: TextStyle(
                    fontFamily: "Source Sans Pro",
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

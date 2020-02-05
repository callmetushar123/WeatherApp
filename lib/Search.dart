import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'Constants.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';



class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String GApi="AIzaSyCUM3uNdQ7ioLIXLBF85dwUUSJZm0W6zoA";
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    MdiIcons.arrowLeft,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
//                  onTap: () async{
//                    Prediction p = await PlacesAutocomplete.show(
//                        context: context,
//                        apiKey: GApi,
//                        //mode: Mode.overlay, // Mode.fullscreen
//                        language: "en",
//                        );
//                  },
                  onChanged: (value){
                    cityName=value;
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kInputDecoration,
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Get Weather',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Source Sans Pro',
                    color: Colors.grey
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

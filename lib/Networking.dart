import 'dart:convert';
import 'dart:ffi';
import 'Location.dart';
import 'package:http/http.dart'as http;
//import 'dart:html';

class Network {
  double latitude;
  double longitude;

  String apiKey='022e0a9cd45c8eacc53d45611ab89616';

  Future getDataName(String cityName)async{
    http.Response response= await http.get('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      return data;
    }
    else
      print(response.statusCode);
  }

  Future getData()async{
    Location loc = Location();
    await loc.getLocation();
    latitude = loc.lat;
    longitude = loc.lon;
    http.Response response= await http.get('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    if(response.statusCode==200)
      {
        var data=jsonDecode(response.body);
        return data;
      }
    else
      print(response.statusCode);

  }

}
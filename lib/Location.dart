import 'package:geolocator/geolocator.dart';

class Location{
  var lat;
  var lon;
  Future getLocation() async{
   try{
     Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
     lat=position.latitude;
     lon=position.longitude;
   }
   catch(e)
    {
      print(e);
    }
  }

}
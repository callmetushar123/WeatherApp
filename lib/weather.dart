import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_icons/weather_icons.dart';
class Weather{
//  String getWeatherIcon(int condition) {
//    if (condition < 300) {
//      return '🌩';
//    } else if (condition < 400) {
//      return '🌧';
//    } else if (condition < 600) {
//      return '☔️';
//    } else if (condition < 700) {
//      return '☃️';
//    } else if (condition < 800) {
//      return '🌫';
//    } else if (condition == 800) {
//      return '☀️';
//    } else if (condition <= 804) {
//      return '☁️';
//    } else {
//      return '🤷‍';
//    }
//  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  Icon getIcon(int condition){
    if (condition < 300) {
      return Icon(WeatherIcons.thunderstorm, color:Colors.red,);
      //return '🌩';
    } else if (condition < 400) {
      return Icon(WeatherIcons.rain_mix, color:Colors.red,);
      //return '🌧';
    } else if (condition < 600) {
  return Icon(WeatherIcons.rain,color:Colors.red,);
      //return '☔️';
    } else if (condition < 700) {
  return Icon(WeatherIcons.snowflake_cold,color:Colors.red,);
      //return '☃️';
    } else if (condition < 800) {
  return Icon(WeatherIcons.day_windy,color:Colors.red,);
      //return '🌫';
    } else if (condition == 800) {
  return Icon(WeatherIcons.day_sunny,color:Colors.red,);
      //return '☀️';
    } else if (condition <= 804) {
  return Icon(WeatherIcons.cloud,color:Colors.red,);
      //return '☁️';
    } else
      return null;
      //return '🤷‍';
    }
  String subtext(int condition){
    if (condition < 300) {
      return "Thunderstorm";
      //return '🌩';
    } else if (condition < 400) {
      return "Drizzle";
      //return '🌧';
    } else if (condition < 600) {
      return "Rain";
      //return '☔️';
    } else if (condition < 700) {
      return "Snow";
      //return '☃️';
    } else if (condition < 800) {
      return "Windy";
      //return '🌫';
    } else if (condition == 800) {
      return "Sunny";
      //return '☀️';
    } else if (condition <= 804) {
      return "Cloudy";
      //return '☁️';
    } else
      return null;
    //return '🤷‍';
  }
}

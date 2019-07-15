import 'package:flutter/material.dart';
import 'package:weatherapp/CityWidget.dart';
import 'package:weatherapp/WeatherWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: CityWidget(),
      )
    );
  }
  
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weatherapp/CityData.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/WeatherWidget.dart';

class CityWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new CityState();
  }

}

class CityState extends State<CityWidget>{
  
  List<CityData> cityList = new List<CityData>();

  CityState(){
    _getCityList();
  }
  
  void _getCityList() async{
  List<CityData> citys = await _fetchCityList();
  setState(() {
    cityList = citys;
  });
  }

  Future<List<CityData>> _fetchCityList() async{
    final response = await http.get('https://search.heweather.net/top?group=cn&key=9dac908d08d8470a88ad449a7acdc54e');

    List<CityData> cityList = new List<CityData>();

    if(response.statusCode == 200){
      //解析数据
      Map<String,dynamic> result = json.decode(response.body);
      for(dynamic data in result['HeWeather6'][0]['basic']){
        CityData cityData = CityData(data['location']);
        cityList.add(cityData);
      }
        return cityList;
    }else{
      return cityList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cityList.length,
      itemBuilder: (context,index){
        return ListTile(
          title:GestureDetector(
            child: Text(cityList[index].cityName),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=>WeatherWidget(cityList[index].cityName))
              );
            },
          )
        );
      },
    );
  }
  
   
    
      

}
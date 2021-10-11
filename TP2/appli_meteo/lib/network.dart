import 'dart:convert';

import 'package:appli_meteo/model/weather_model.dart';
import 'package:http/http.dart';

class Network{
  Future<WeatherModel> getWeather({required String cityName}) async{
    var finalUrl ="https://api.openweathermap.org/data/2.5/weather?q="+cityName+"&appid=b6226c21fbdcf89c8c387c2d727841c5";
    final reponse = await get(Uri.parse(finalUrl));
    print("URL: ${Uri.encodeFull(finalUrl)}");

    if(reponse.statusCode == 200){
      print("weather data: ${reponse.body}");
      return WeatherModel.fromJson(json.decode(reponse.body));
    }else{
      throw Exception("Error while getting weather datas");
    }
  }
}
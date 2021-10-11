import 'package:appli_meteo/model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';

import 'package:appli_meteo/model/weather_model.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Weather App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {



  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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

  Widget getWeatherIcon({required String weatherDescription, required Color color, required double size}){
    switch(weatherDescription){
      case "Clear":
        {return Icon(FontAwesomeIcons.sun, color: color, size: size,);}
        break;
      case "Clouds":
        {return Icon(FontAwesomeIcons.cloud, color: color, size: size,);}
        break;
      case "Rain":
        {return Icon(FontAwesomeIcons.cloudRain, color: color, size: size,);}
        break;
      case "Snow":
        {return Icon(FontAwesomeIcons.snowman, color: color, size: size,);}
        break;
      default: {return Icon(FontAwesomeIcons.snowman, color: color, size: size,);}
        break;
    }
  }

  Widget showCountry(){
      if(w !=null){
        return  Text(
          w!.name.toString()+','+w!.sys!.country.toString(),
          style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        );
    } else{
        return Text("");
      }
  }
  Widget showDescription(){
    if(w !=null){
      return Text(
        w!.weather![0].description.toString(),
        style: TextStyle(fontSize: 20, color: Colors.black),
      );
    }else{
      return Text("");
    }
  }

  Widget showWeather(){
    if(w !=null){
      return Text(
          (double.parse(w!.main!.temp.toString())-272).round().toString()+'°C',
        style: TextStyle(fontSize: 30, color: Colors.black,fontWeight: FontWeight.bold),
      );
    }else{
      return Text("");
    }
  }
  Widget showHumidity(){
    if(w !=null){
      return Text(
        w!.main!.humidity.toString()+'%',
        style: TextStyle(fontSize: 20, color: Colors.black),
      );
    }else{
      return Text("");
    }
  }

  Widget showTempMin(){
    if(w !=null){
      return Text(

        'Min '+(double.parse(w!.main!.tempMin.toString())-272).round().toString()+'°C',
        style: TextStyle(fontSize: 17, color: Colors.black),
      );
    }else{
      return Text("");
    }
  }

  Widget showTempMax(){
    if(w !=null){
      return Text(
        'Max '+(double.parse(w!.main!.tempMax.toString())-272).round().toString()+'°C',
        style: TextStyle(fontSize: 17, color: Colors.black),
      );
    }else{
      return Text("");
    }
  }


  Widget futureBuilder(){
    return FutureBuilder(
        future: getWeather(cityName: city),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return CircularProgressIndicator();
          } else {
            w = snapshot.data;

            return
              getWeatherIcon(weatherDescription: w!.weather![0].main
                  .toString(), color: Colors.red, size: 150.0);
          }
          setState(() {
            w = snapshot.data;
          });
        }

    );
  }









   WeatherModel? w  ;
  var city = "";
  var date = DateFormat.yMMMMd().format(DateTime.now());
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Widget getTextField(){
    return const TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter a search term'
      ),
    );

  }

  void getText(){
    print("rext");
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 500,
              height: 800,
              color:Colors.lightBlueAccent,
            ),
            Positioned(
              top:23,
              right: 15,
              child: Container(
                width: 60,
                height: 60,
                child:  IconButton(
                    icon: Icon(Icons.search),
                    iconSize: 30,
                    color: Colors.white,
                    onPressed: (){

                      setState(() {
                        city = myController.text.toString();
                        //futureBuilder();
                      });

                    }
                ),
              ),
            ),

              Positioned(
              top: 100,
                child: showCountry()
                /*Text(
                  w!.name.toString()+','+w!.sys!.country.toString(),
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),*/
              ),
            Positioned(
              top: 150,
              child: Text(

                date,
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),

              Positioned(
              top:20,
              left: 50,
              width: 320,
              child: Container(
                width: 320,
                child:  TextField(
                  controller: myController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Entrez une ville'

                ),
              ),
            ),
             ),

            Positioned(
              top: 500,
              child: showDescription()
            ),
            Positioned(
              top: 460,
              child: showWeather()
            ),

            Positioned(
              top: 240,
              left: 80,
              child: showHumidity()
            ),
            const Positioned(
              top: 260,
              left: 80,
              child: Icon(
                Icons.hot_tub,
                color: Colors.red,
                size: 30,

              ),
            ),

            Positioned(
              top: 240,
              left: 170,
              child: showTempMin()
            ),
            const Positioned(
              top: 260,
              left: 200,
              child: Icon(
                Icons.wb_twighlight,
                color: Colors.red,
                size: 30,

              ),
            ),

            Positioned(
              top: 240,
              left: 270,
              child: showTempMax()
            ),
            const Positioned(
              top: 260,
              left: 300,
              child: Icon(
                Icons.wb_twilight_sharp,
                color: Colors.red,
                size: 30,

              ),
            ),

            Positioned(
            child: Container(
              //margin: const EdgeInsets.all(-50.0),
              alignment: Alignment.center,
              child: futureBuilder()

            ),
            ),



            const Text(
              ""
            ),

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

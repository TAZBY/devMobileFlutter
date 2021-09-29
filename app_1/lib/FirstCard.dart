import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
      home: const MyHomePage(title: 'FirstCard'),
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


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[



            Container(
              width: 300,
              height: 200,
              padding: const EdgeInsets.only(top: 0),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 60,

                    child : Container(
                        width: 90.0,
                        height: 90.0,
                        padding: const EdgeInsets.only(top: 0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://i.imgur.com/BoN9kdC.png")
                            )
                        )),
                  ),



                  Text(
                    'BARRY Thierno',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Barryzainoul14@gmail.com',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'twitter: @zainoul',
                    style: TextStyle(color: Colors.white),

                  )

                ],
              ),
              decoration: BoxDecoration(color: Colors.pink,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Theme.of(context).accentColor,)
              ),

            ),



          ],
        ),
      ),

    );

  }
}

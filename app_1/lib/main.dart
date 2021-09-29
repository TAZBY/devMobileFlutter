import 'package:flutter/material.dart';

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
        title: Text(widget.title),
      ),
      body: Center(

        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
          Container(
          width: 300,
          height: 500,
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.transparent)
          ),

        ),
            Positioned(
            top: 100,
            child :Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(color: Colors.blue,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.transparent)
              ),

            ),

            ),
            Positioned(
              top: 160,
              left: 100.0,
              right: 0.0,
             child: Text(
               'BARRY Thierno',
                style: TextStyle(color: Colors.white),
             ),

            ),
            Positioned(
              top: 185,
              left: 60,
              right: 60,
              child: Text(
                'barryzainoul14@gmail.com',
                style: TextStyle(color: Colors.white),
              ),

            ),
            Positioned(
              top: 210,
              left: 100.0,
              right: 0.0,
              child: Text(
                'Twiter : @thierno',
                style: TextStyle(color: Colors.white),
              ),

            ),
            Positioned(
              top: 205,
              left: 70,
              child: Icon(
                Icons.account_circle,
                color: Colors.white,

              ),

            ),

            Positioned(
              top: 50,
              left: 100.0,

              child :Container(
                  width: 90.0,
                  height: 90.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue ,
                    image:  DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://i.imgur.com/BoN9kdC.png")
                    ),

                  )),

            ),

          ],
        ),
      ),

    );
  }
}

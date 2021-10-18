import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pratique/presentation/page/ajoutquestion.dart';
import 'package:pratique/presentation/page/quizz.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'o7planning.org',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Page1(),
    );
  }
}

class Page1 extends StatelessWidget {



  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 25,color: Colors.pink));

    return Scaffold(

      appBar: AppBar(
        title: Text("Accueil"),
      ),
      body: Container(
        width: 500,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(

                "https://st.depositphotos.com/1032577/4119/i/600/depositphotos_41197145-stock-photo-quiz.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
        ElevatedButton(
          child: const Text('Ajouter des question'),
          style: style,
          onPressed: () {
            //Navigator.of(context).push(_createRoute2());
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AjoutQuestion()));
          },
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          child: const Text('Jouer'),
          style: style,
          onPressed: () {

            //Navigator.of(context).push(_createRoute1());
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Quizz()));
          },
        ),
       ],
       ),

      ),
    );
  }
}


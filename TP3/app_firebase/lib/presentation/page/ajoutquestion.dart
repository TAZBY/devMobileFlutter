import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pratique/presentation/page/quizz.dart';

void main() {
  runApp(const AjoutQuestion());
}

class AjoutQuestion extends StatelessWidget {
  const AjoutQuestion({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  String  succesVal="";
  String  erVal="";

  final question = TextEditingController();
  final rep = TextEditingController();
  final firebase = FirebaseFirestore.instance;
  Future<void> create() async{
      if(question.text != '' && rep.text!=''){
      await firebase.collection("question").doc().set({
        "question": question.text,
        "reponse": rep.text
      });
      setState(() {
        succesVal ="ajoute avec succes";
        erVal = '';
      });
      }else{
        setState(() {
          erVal ="champ.s vides";
          succesVal = '';
        });
      }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulaire d'ajout "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  <Widget>[

            TextField(
              controller: question,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Entrez une question'

              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: rep,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Entrez une reponse'

              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Ajouter'),
              style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 25,color: Colors.green) , backgroundColor: Colors.green),
              onPressed: () {
                create();
                rep.clear();
                question.clear();

              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              succesVal,
              style: TextStyle(color: Colors.green,fontSize: 20),
            ),
            Text(
              erVal,
              style: TextStyle(color: Colors.red,fontSize: 24),
            )

          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

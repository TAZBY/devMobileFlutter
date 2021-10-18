import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pratique/data/dataprovider/database.dart';

import 'main.dart';

void main() {

  runApp(const Quizz());
}

class Quizz extends StatelessWidget {
  const Quizz({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questions/Réponses"),
      ),
      body: const Center(
        child: MyHomePage(title: ''),
      ),
      backgroundColor: Colors.lightGreen[100],
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

  var questions = [];
  var reponses =[];
  final firestore = FirebaseFirestore.instance;
  Future read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('question').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {"id": doc.id, "question": doc['question']};
          Map b = {"id": doc.id, "reponse": doc['reponse']};
          setState(() {
            questions.add(a);
            reponses.add(b);
          });


        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    super.initState();
    setState(() {
      read();
    });

  }

  int i = 0;
  String rep = '';
  String choix ='';
  /*var questions = ['Le 14 juillet c''est la fête nartionale de la France ?',
    'La France a gagné la coupe du monde en 2014',
    'La devise de la France est liberté-égalité-fraternité',
    'Le drapeau de la france c''est le bleu-blanc-rouge',
    'La monnaie Française est le Franc'];*/
  //var reponses = ['vrai','faux','vrai','vrai','faux'];

  void suivantButton(){
    setState(() {
      if(i == questions.length-1){
        i = 0;
      }
      else{
        i+= 1;
      }
      rep ='';
      choix = '';
    });
  }
  String trueChoice(){
    setState(() {
      choix = 'vrai';
    });

    return choix;
  }
  String falseChoice(){
    setState(() {
      choix = 'faux';
    });
    return choix;
  }
  void quizRep(){
    setState(() {
      if(choix == ''){
        rep = '';
      }else{
        if(reponses[i]['reponse'].toString()=='vrai' && choix=='vrai'){
          rep = 'boonne reponse';
        }
        else if(reponses[i]['reponse'].toString()=='faux' && choix=='faux'){
          rep = 'boonne reponse';
        }
        else{
          rep = 'mauvaise reponse';

        }
      }
    });

  }

  String responseToReturn(){
    quizRep();
    return rep;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Stack(

          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 500,
              height: 1000,
              decoration: BoxDecoration(color: Colors.white70,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.transparent)
              ),

            ),
            Positioned(
              top: 260,
              child :Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(color: Colors.pink,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.transparent)
                ),


              ),

            ),

            Positioned(
              top : 340,
              width: 300,
              child: Text(
                questions[i]['question'].toString(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,fontSize: 18,),
              ),
            ),


            Positioned(
              top : 500,
              left: 70,
              child : ElevatedButton(
                onPressed: falseChoice,
                child: const Text('Faux'),

              ),
            ),
            Positioned(
              top : 500,
              left: 150,
              child : ElevatedButton(
                onPressed: trueChoice,
                child: const Text('Vrai'),

              ),
            ),
            Positioned(
              top : 500,
              right: 70,
              child : ElevatedButton(
                onPressed: suivantButton,
                child: const Text('Suiv'),

              ),
            ),

            Positioned(
              top : 570,
              right: 70,
              left: 70,
              child : Text(
                responseToReturn(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20),

              ),
            ),

            Positioned(
              top: 50,

              child :Container(
                  width: 400.0,
                  height: 200.0,
                  decoration: const BoxDecoration(
                    color: Colors.blue ,
                    image:  DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://st.depositphotos.com/1032577/4119/i/600/depositphotos_41197145-stock-photo-quiz.jpg")
                    ),

                  )),

            ),

          ],
        ),
      ),

    );
  }
}

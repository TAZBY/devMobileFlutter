import 'package:appli_1_provider/cubit/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Question(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Cubit, and Testing Basics'),
      ),
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
    var reponseToReturn = BlocProvider.of<Question>(context).getReponse();
    var question = BlocProvider.of<Question>(context).getQuestion();
    var questions = ['Le 14 juillet c''est la fête nationale de la France ?',
      'La France a gagné la coupe du monde en 2014',
      'La devise de la France est liberté-égalité-fraternité',
      'Le drapeau de la france c''est le bleu-blanc-rouge',
      'La monnaie Française est le Franc'];
    var reponses = ['vrai','faux','vrai','vrai','faux'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Question/Reponse"),
      ),
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
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.transparent)
                ),


              ),

            ),


             Positioned(
               top: 340,
               left: 70,
               width: 300,
               child: BlocBuilder<Question, OperatorState>(
              builder: (context, state) {

                return Text(
                  questions[state.i],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18,),
                );
              },
            ),
           ),
            Positioned(
              top: 500,
              left: 70,
              child: ElevatedButton(
                onPressed: () => BlocProvider.of<Question>(context).falseChoice(),
                child: const Text('Faux'),

              ),
            ),
            Positioned(
              top: 500,
              left: 190,
              child: ElevatedButton(
                onPressed: () => BlocProvider.of<Question>(context).trueChoice(),
                child: const Text('Vrai'),

              ),
            ),
            Positioned(
              top: 500,
              right: 70,
              child: ElevatedButton(
                onPressed: () => BlocProvider.of<Question>(context).suivantButton(),
                child: const Text('suiv'),

              ),
            ),

            Positioned(
              top: 570,
              right: 70,
              left: 70,
              child: BlocBuilder<Question, OperatorState>(
                builder: (context, state) {

                  return Text(
                    BlocProvider.of<Question>(context).getReponse(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 18,),
                  );
                },
              ),
            ),

            Positioned(
              top: 50,

              child: Container(
                  width: 400.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://www.laculturegenerale.com/wp-content/uploads/2016/09/quiz-culture-generale.png")
                    ),

                  )),

            ),

          ],
        ),
      ),

    );
  }



}

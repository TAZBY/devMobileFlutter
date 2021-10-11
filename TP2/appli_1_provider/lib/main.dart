import 'package:appli_1_provider/question.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Question(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: "AndroidVille Provider Pattern"),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  void _suivantButton(BuildContext context) {
    Provider.of<Question>(context, listen: false).suivantButton();
  }
  void _trueChoice(BuildContext context) {
    Provider.of<Question>(context, listen: false).trueChoice();
  }
  void _falseChoice(BuildContext context) {
    Provider.of<Question>(context, listen: false).falseChoice();
  }
  void _responseToReturn(BuildContext context) {
    Provider.of<Question>(context, listen: false).responseToReturn();
  }

  @override
  Widget build(BuildContext context) {
    var reponseToReturn = Provider.of<Question>(context).getReponse();
    var question = Provider.of<Question>(context).getQuestion();
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
              top : 340,
              left: 70,
              width: 300,
              child: Text(
                question,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,fontSize: 18,),
              ),
            ),


            Positioned(
              top : 500,
              left: 70,
              child : ElevatedButton(
                onPressed: ()=> _falseChoice(context),
                child: const Text('Faux'),

              ),
            ),
            Positioned(
              top : 500,
              left: 190,
              child : ElevatedButton(
                onPressed: ()=> _trueChoice(context),
                child: const Text('Vrai'),

              ),
            ),
            Positioned(
              top : 500,
              right: 70,
              child : ElevatedButton(
                onPressed: ()=> _suivantButton(context),
                child: const Text('Suiv'),

              ),
            ),

            Positioned(
              top : 570,
              right: 70,
              left: 70,
              child : Text(
                reponseToReturn,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20),

              ),
            ),

            Positioned(
              top: 50,

              child :Container(
                  width: 400.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.blue ,
                    image:  DecorationImage(
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

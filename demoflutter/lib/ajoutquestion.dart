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

  final myController = TextEditingController();
  final firebase = FirebaseFirestore.instance;
  create() async{
    await firebase.collection("question").doc().set({
      "question": myController.text,
      "reponse": myController.text
    });
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
              controller: myController,
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
              controller: myController,
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
                //Navigator.of(context).push(_createRoute1());

              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

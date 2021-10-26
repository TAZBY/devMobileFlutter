import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  var togglecall;
  Home({this.togglecall});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool switchVal = false;

  switchValuechange(bool newVal){
    setState(() {
      switchVal = newVal;
      widget.togglecall;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accueil"),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.colorize),
            onPressed: widget.togglecall,
          ),
          Switch(
            value: switchVal,
            onChanged: (newVal) {
              switchValuechange(newVal);
              setState(() {
                Home().togglecall;
              });

            },
          ),
        ],
      ),
      body:Container(
      width: 500,
      decoration: const BoxDecoration(
      image: DecorationImage(
      image: NetworkImage(

      "https://st.depositphotos.com/1032577/4119/i/600/depositphotos_41197145-stock-photo-quiz.jpg"),
      fit: BoxFit.cover,
      ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(
            height: 200,
          ),

          ElevatedButton(
            child: const Text('Ajouter des question'),
            onPressed:
              widget.togglecall,
              //Navigator.of(context).push(_createRoute2());


          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: const Text('Jouer'),
            onPressed: () {

              //Navigator.of(context).push(_createRoute1());
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()));
            },
          ),
        ],
      ),
      ),
    );
  }
}


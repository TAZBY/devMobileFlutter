import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int thememode = 1;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  starting()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(pref.getInt("thememode")!=null ){
      thememode = pref.getInt("thememode")!;
    }else{
      pref.setInt("thememode", thememode );
    }
    setState(() {

    });

  }
  toggletheme()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(pref.getInt("thememode")==1 ){
      pref.setInt("thememode", 0 );
      thememode = 0;
    }else{
      pref.setInt("thememode", 1 );
      thememode = 1;
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(togglecall: toggletheme,),
      theme: ThemeData(
        primaryColor: Colors.pink,
        cardColor: Colors.lightBlueAccent,
        buttonColor: Colors.black38,

      ),
      darkTheme: ThemeData.dark().copyWith(
          primaryColor: Theme.of(context).colorScheme.primary,
          cardColor: Colors.black87
          
      ),
      themeMode: thememode==1? ThemeMode.dark:ThemeMode.light,
    );
  }
}

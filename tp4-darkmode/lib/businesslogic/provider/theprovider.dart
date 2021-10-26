import 'package:flutter/material.dart';



class ThemeProvider extends ChangeNotifier {
  bool switchVal = false;

  switchValuechange(bool newVal){
    switchVal = newVal;
    notifyListeners();
  }
  getSwitchVal(){
    return switchVal;
    notifyListeners();

  }

}
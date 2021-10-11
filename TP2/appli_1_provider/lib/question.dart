import 'package:flutter/material.dart';


class Question extends ChangeNotifier {
  int i = 0;
  String rep = '';
  String choix ='';
  var questions = ['Le 14 juillet c''est la fête nationale de la France ?',
    'La France a gagné la coupe du monde en 2014',
    'La devise de la France est liberté-égalité-fraternité',
    'Le drapeau de la france c''est le bleu-blanc-rouge',
    'La monnaie Française est le Franc'];
  var reponses = ['vrai','faux','vrai','vrai','faux'];

  String getRep(){
    return rep;
  }
  String getChoix(){
    return choix;
  }
  String getQuestion(){
    return questions[i];
  }
  String getReponse(){
    return responseToReturn();
  }
  void suivantButton(){
    if(i == questions.length-1){
      i = 0;
    }
    else{
      i+= 1;
    }
    rep ='';
    choix = '';
    notifyListeners();

  }
  String trueChoice(){
    choix = 'vrai';
    notifyListeners();
    return choix;
  }
  String falseChoice(){
    choix = 'faux';
    notifyListeners();
    return choix;
  }
  void quizRep(){
    if(choix == ''){
      rep = '';
    }else{
      if(reponses[i]=='vrai' && choix=='vrai'){
        rep = 'boonne reponse';
      }
      else if(reponses[i]=='faux' && choix=='faux'){
        rep = 'boonne reponse';
      }
      else{
        rep = 'mauvaise reponse';

      }
    }
    notifyListeners();


  }

  String responseToReturn(){
    quizRep();
    return rep;
  }



}
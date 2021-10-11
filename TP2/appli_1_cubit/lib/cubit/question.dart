import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'operator_state.dart';

class Question extends Cubit<OperatorState> {

  Question() : super(OperatorState(i: 0,rep: "", choix: ""));
  var questions = ['Le 14 juillet c''est la fête nationale de la France ?',
    'La France a gagné la coupe du monde en 2014',
    'La devise de la France est liberté-égalité-fraternité',
    'Le drapeau de la france c''est le bleu-blanc-rouge',
    'La monnaie Française est le Franc'];
  var reponses = ['vrai','faux','vrai','vrai','faux'];


  int getI(){
    return state.i;
  }
  String getRep(){
    return state.rep;
  }
  String getChoix(){
    return state.choix;
  }
  String getQuestion(){
    return questions[getI()];
  }
  String getReponse(){
    return responseToReturn();
  }


  void suivantButton(){

    if(state.i== questions.length-1){
      emit(
      OperatorState(i:0,rep: state.rep ,choix: state.choix),
     );
    }
    else{
      emit(
          OperatorState(i: state.i + 1,rep: state.rep ,choix: state.choix),
      );

    }
    emit(
        OperatorState(i: state.i,rep: '' ,choix: ''),
    );
  }


  String trueChoice(){
    emit(
        OperatorState(i: state.i,rep: state.rep ,choix: 'vrai'),
    );
    return state.choix;
  }
  String falseChoice(){
    emit(
      OperatorState(i: state.i,rep: state.rep ,choix: 'faux'),
    );
    return state.choix;
  }
  void quizRep(){
    if(state.choix == ''){
      emit(
          OperatorState(i: state.i,rep:'' ,choix: state.choix),
      );
    }else{
      if(reponses[state.i]=='vrai' && state.choix=='vrai'){
        emit(
        OperatorState(i: state.i,rep: 'boonne reponse' ,choix: state.choix),
        );
      }
      else if(reponses[state.i]=='faux' && state.choix=='faux'){
        emit(
          OperatorState(i: state.i,rep: 'boonne reponse' ,choix: state.choix),
        );
      }
      else{
        emit(
          OperatorState(i: state.i,rep: 'mauvaise reponse' ,choix: state.choix),
        );

      }
    }


  }

  String responseToReturn(){
    quizRep();
    return state.rep;
  }

}
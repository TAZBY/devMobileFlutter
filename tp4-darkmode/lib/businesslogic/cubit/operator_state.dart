part of 'question.dart';


class OperatorState extends Equatable {
  int i = 0;
  String rep = '';
  String choix ='';


  OperatorState({required this.i,required this.rep,required this.choix});

  @override
  List<Object> get props => [this.i,this.rep,this.choix];
}



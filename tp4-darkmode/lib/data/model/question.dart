class Question{
  String questionText;
  bool isCorrect;

  Question({required this.questionText,required this.isCorrect});

  List<String> listeQuestion(){
    return ['Le 14 juillet c''est la fête nationale de la France ','La France a gagné la coupe du monde en 2014'];
  }


}
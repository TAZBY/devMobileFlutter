Stream<int> CountStream() async*{
         for(int i =1; i<= 10;i++){
             print(" Sent boat no,"+i.toString());
             await Future.delayed(Duration(seconds : 2));
             yield i; 
            }
}

void main(List<String> args) async{
     Stream<int> stream = CountStream();
     stream.listen((receiveData){
         print('Receiving boat no :'+receiveData.toString());;
     });
}
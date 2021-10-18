
import 'package:cloud_firestore/cloud_firestore.dart';

class Database{
  late FirebaseFirestore firestore;
  initialise(){
    firestore = FirebaseFirestore.instance;
  }
  Future read() async {
    QuerySnapshot querySnapshot;
    List docs=[];
    try{
      querySnapshot = await firestore.collection('question').get();
      if(querySnapshot.docs.isNotEmpty){
        for(var doc in querySnapshot.docs.toList()){
          Map a = {"id": doc.id, "question":doc['question']};
          docs.add(a);
          print("""""""""""""""""""""""""""""""""""""""""""");

        }
        return docs;
      }

    }catch(e){
      print(e);
    }

  }

}
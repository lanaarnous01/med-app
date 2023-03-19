

import 'package:cloud_firestore/cloud_firestore.dart';

final patientCollection = FirebaseFirestore.instance.collection("patient");
final usersCollection = FirebaseFirestore.instance.collection("patient");
List <String> Ids = [];
List <String> wholeID = [];
 Future <List<String>> getIDs() async {
   Ids = [];
   wholeID = [];
 await patientCollection.get().then(
        (value) {
      for(int i = 0; i < value.docs.length; i ++)
      {
        Ids.add(value.docs[i].get("codeID"));
        wholeID.add(value.docs[i].id);
      }
    },
  );
  print(Ids);
  return Ids;
}

void documentsLoopFromFirestore() {

}
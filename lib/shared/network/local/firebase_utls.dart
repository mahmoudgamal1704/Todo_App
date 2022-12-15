import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/data/task.dart';

CollectionReference<Task> getTaskCollection (){
  return  FirebaseFirestore.instance.collection('Task')
      .withConverter<Task>(

    fromFirestore: (snapshot, options) => Task.fromJson(snapshot.data()!),
    toFirestore: (task, options) => task.toJson(),);
}
getTaskfromFirestore() async {
  var collection = getTaskCollection();
  QuerySnapshot querySnapshot = await collection.get();
  List j = querySnapshot.docs;
  print(j[0]);
}
void addTaskToFireStore(Task task) {
 var collection = getTaskCollection();
 var doc = collection.doc();
 task.id = doc.id;
 doc.set(task);
}
void editTaskfromFireStore(Task task) {
  var collection = getTaskCollection();
  print('${task.id}');
  var doc = collection.doc(task.id);
  doc.update(task.toJson());
}
void deleteTaskFromFirestore(Task task){
  var collection = getTaskCollection();
  collection.doc('${task.id}').delete();
}
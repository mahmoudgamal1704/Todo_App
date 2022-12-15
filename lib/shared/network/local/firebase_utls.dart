import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/data/task.dart';

CollectionReference<Task> getTaskCollection (){
  return  FirebaseFirestore.instance.collection('Task')
      .withConverter<Task>(

    fromFirestore: (snapshot, options) => Task.fromJson(snapshot.data()!),
    toFirestore: (task, options) => task.toJson(),);
}
// getTaskfromFirestore() async {
//   var collection = getTaskCollection();
//   QuerySnapshot querySnapshot = await collection.get();
//   List j = querySnapshot.docs;
// }
Future<void> addTaskToFireStore(Task task) {
 var collection = getTaskCollection();
 var doc = collection.doc();
 task.id = doc.id;
 return doc.set(task);
}
Future<void> editTaskfromFireStore(Task task) {
  var collection = getTaskCollection();
  var doc = collection.doc(task.id);
  return doc.update(task.toJson());
}
void deleteTaskFromFirestore(Task task){
  var collection = getTaskCollection();
  collection.doc('${task.id}').delete();
}
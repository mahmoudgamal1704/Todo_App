import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/data/task.dart';

CollectionReference<Task> getTaskCollection (){
  return  FirebaseFirestore.instance.collection('Task')
      .withConverter<Task>(

    fromFirestore: (snapshot, options) => Task.fromJson(snapshot.data()!),
    toFirestore: (task, options) => task.toJson(),);
}
getTaskfromFirestore(){
  var collection = getTaskCollection();
  // collection.get()
}
void addTaskToFireStore(Task task) {
 var collection = getTaskCollection();
 var doc = collection.doc();
 task.id = doc.id;
 doc.set(task);
}
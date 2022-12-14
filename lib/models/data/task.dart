// import 'package:firebase_storage/firebase_storage.dart';

class Task {
  String id;
  String title;
  String description;
  int date;
  // DateTime date;
  bool isDone;

  Task(
      {this.id = "", required this.title, required this.description, required this.date, this.isDone = false});
  Task.fromJson(Map<String,dynamic>json)
  :this(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    date: json["date"],
    isDone: json["isDone"]
  );
  Map<String,dynamic> toJson(){
    return {
      "id":id,
      "title" :title,
      "description":description,
      "date":date,
      "isDone":isDone
    };
  }
}
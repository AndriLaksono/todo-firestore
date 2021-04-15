import 'package:flutter/foundation.dart';
import '../utils.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  String id;
  String title;
  String description;
  bool isDone;

  Todo({
    @required this.createdTime,
    @required this.id,
    this.title = '',
    this.description = '',
    this.isDone = false,
  });

  static Todo fromJson(Map<String, dynamic> json) => Todo(
    createdTime: Utils.toDateTime(json['createdTime']),
    title: json['title'],
    id: json['id'],
    description: json['description'],
    isDone: json['isDone'],
  );

  Map<String, dynamic> toJson() {
    return {
      'createdTime': Utils.fromDateToJson(createdTime),
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone
    };
  }
}
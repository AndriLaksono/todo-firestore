import 'package:flutter/foundation.dart';

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
}
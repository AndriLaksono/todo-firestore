import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Woi test'
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Woi test 2',
      description: 'Bodoamat'
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Ini lagi',
      description: 'Dah lah'
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Sahur woy',
      description: 'Dah lah'
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Astaga',
      description: 'Sip oke'
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Mantap',
      description: 'Mantap Mantap'
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Hehe',
      description: 'Gabut'
    ),
  ];

  List<Todo> get todos => _todos.where((el) => el.isDone == false).toList();
  
}
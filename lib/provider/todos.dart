import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      id: DateTime.now().toIso8601String(),
      createdTime: DateTime.now(),
      title: 'Woi test'
    ),
    Todo(
      id: DateTime.now().toIso8601String(),
      createdTime: DateTime.now(),
      title: 'Woi test 2',
      description: 'Bodoamat'
    ),
    Todo(
      id: DateTime.now().toIso8601String(),
      createdTime: DateTime.now(),
      title: 'Ini lagi',
      description: 'Dah lah'
    ),
    Todo(
      id: DateTime.now().toIso8601String(),
      createdTime: DateTime.now(),
      title: 'Sahur woy',
      description: 'Dah lah'
    ),
    Todo(
      id: DateTime.now().toIso8601String(),
      createdTime: DateTime.now(),
      title: 'Astaga',
      description: 'Sip oke'
    ),
    Todo(
      id: DateTime.now().toIso8601String(),
      createdTime: DateTime.now(),
      title: 'Mantap',
      description: 'Mantap Mantap'
    ),
    Todo(
      id: DateTime.now().toIso8601String(),
      createdTime: DateTime.now(),
      title: 'Hehe',
      description: 'Gabut'
    ),
  ];

  List<Todo> get todos => _todos.where((el) => el.isDone == false).toList();
  List<Todo> get todosCompleted => _todos.where((el) => el.isDone == true).toList();
  
  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.removeWhere((element) => element.id == todo.id);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    
    notifyListeners();
  }

}
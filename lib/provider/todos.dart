import 'package:flutter/material.dart';

import '../api/firebase_api.dart';
import '../models/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos.where((el) => el.isDone == false).toList();
  List<Todo> get todosCompleted => _todos.where((el) => el.isDone == true).toList();

  void setTodos(List<Todo> todos) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _todos = todos;
      notifyListeners();
    });
  }
  
  void addTodo(Todo todo) {
    FirebaseApi.createTodo(todo);

    // _todos.add(todo);
    // notifyListeners();
  }

  void removeTodo(Todo todo) {
    FirebaseApi.deleteTodo(todo);

    // _todos.removeWhere((element) => element.id == todo.id);
    // notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    FirebaseApi.updateTodo(todo);

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    
    FirebaseApi.updateTodo(todo);
  }

}
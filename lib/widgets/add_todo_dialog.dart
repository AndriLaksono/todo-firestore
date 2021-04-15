import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todos.dart';
import '../models/todo.dart';
import './todo_form.dart';

class AddTodoDialogWidget extends StatefulWidget {
  AddTodoDialogWidget({Key key}) : super(key: key);

  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Todo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22
              ),
            ),
            TodoFormWidget(
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) => setState(() => this.description = description),
              onSaveTodo: addTodo
            )
          ],
        ),
      ),
    );
  }

  void addTodo() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      
    } else {
      final todo = Todo(
        id: DateTime.now().toIso8601String(),
        title: title,
        description: description,
        createdTime: DateTime.now()
      );
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todos.dart';
import './todo_widget.dart';

class TodoListWidget extends StatelessWidget {

  const TodoListWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty 
    ? Center(
      child: Text('No Todos.'),
    )
    : ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      itemCount: todos.length,
      separatorBuilder: (context, index) => Container(height: 8),
      itemBuilder: (BuildContext context, int index) {
        final todo = todos[index];
        return TodoWidget(
          todo: todo
        );
      },
    );
  }
}
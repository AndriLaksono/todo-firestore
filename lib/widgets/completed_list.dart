import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/todo_widget.dart';
import '../provider/todos.dart';

class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todosCompleted;

    return todos.isEmpty 
    ? Center(
      child: Text('No completed tasks.'),
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
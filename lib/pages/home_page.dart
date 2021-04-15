import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todos.dart';
import '../api/firebase_api.dart';

import '../widgets/add_todo_dialog.dart';
import '../widgets/todo_list.dart';
import '../widgets/completed_list.dart';
import '../models/todo.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),

      body: StreamBuilder<List<Todo>>(
        stream: FirebaseApi.readTodos(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Something went wrong.',
                    style: TextStyle(fontSize: 24, color: Colors.redAccent),
                  ),
                );
              } else {
                final todos = snapshot.data;
                final provider = Provider.of<TodosProvider>(context);
                provider.setTodos(todos);

                return tabs[selectedIndex];
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
          context: context, 
          builder: (BuildContext ctx) => AddTodoDialogWidget(),
          barrierDismissible: false
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Todos'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28),
            label: 'Completed'
          )
        ],
      ),
    );
  }
}
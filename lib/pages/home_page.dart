import 'package:flutter/material.dart';

import '../widgets/add_todo_dialog.dart';
import '../widgets/todo_list.dart';
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
      Container(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),

      body: tabs[selectedIndex],
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
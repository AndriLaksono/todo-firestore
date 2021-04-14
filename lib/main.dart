import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/todos.dart';
import './pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  static final String title = 'TODO App';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Color(0xFFf6f5ee)
        ),
        home: HomePage(),
      ),
    );
  }
}
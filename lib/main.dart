import 'package:flutter/material.dart';
import 'package:technical_task/screens/home_screen.dart';
import 'package:technical_task/screens/loading_screen.dart';
import 'package:technical_task/screens/repos_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technical Task',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF212733),
          primarySwatch: Colors.deepPurple,
          primaryColor: Colors.blue,
          appBarTheme: AppBarTheme(
            color: Colors.blue,
          )),
      routes: {
        HomeScreen.id:(context)=>HomeScreen(),
        ReposScreen.id:(context)=>ReposScreen(),
        LoadingScreen.id:(context)=>LoadingScreen(),
      },
    );
  }
}


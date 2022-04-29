//@dart=2.9
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app2/home_layout_screen.dart';

import 'bloc_observer.dart';
void main() {
  Bloc.observer = MyBlocObserver();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeLayout(),
    );
  }
}


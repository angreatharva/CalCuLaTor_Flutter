import 'package:calculator/HomePage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(new MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: HomePage(),
    );

  }
}

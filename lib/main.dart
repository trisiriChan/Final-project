import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projnew/providers/calculator.dart';
import 'package:projnew/screens/home_screen.dart';
import 'package:projnew/screens/second_screen.dart';
import 'package:projnew/screens/third_screen.dart';
import 'package:projnew/screens/fourth_screen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Calculator()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/second': (context) => SecondScreen(),
        '/third': (context) => ThirdScreen(),
        '/fourth': (context) => FourthScreen(),
      },
    );
  }
}

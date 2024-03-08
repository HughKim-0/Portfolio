import 'package:flutter/material.dart';
import 'package:portfolio/screen/home_page.dart';
import 'package:portfolio/utils/fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hugh Kim Portfolio',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: const TextTheme(
              displayLarge: TextStyle(
                color: whiteColor,
                fontSize: 30,
              ),
            )),
        home: const HomePage());
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_namer/random_word.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Startup Name Generator',

      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),

      home: const RandomWord(), // RandomWord(),
    );
  }
}

import 'package:day14/pages/contact.dart';
import 'package:day14/flipbox.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      title: 'MOLAY APP',
     
      home: MyHomePage() ,
    );
  }
}


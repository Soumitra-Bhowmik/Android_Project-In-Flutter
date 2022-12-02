import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_39/Pages/homepage.dart';
import 'package:travel_39/Pages/viewpage.dart';
import 'package:travel_39/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     title: 'Molay App',
     home: SplashScreen(),
  // home: HomePage(),
  // home: ViewPage(),
     
    );
  }
}


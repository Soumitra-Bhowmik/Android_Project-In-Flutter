import 'package:flutter/material.dart';
import 'package:sakir_exam_3/ApiDara/Provider.dart';
//import 'package:sakir_exam_3/ApiDara/api.dart';
import 'package:provider/provider.dart';
import 'package:sakir_exam_3/ApiDara/api.dart';

void main() {
  runApp(
      //MultiProvider(providers: [
      //ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
      //], child:
      const MyApp());
  //);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

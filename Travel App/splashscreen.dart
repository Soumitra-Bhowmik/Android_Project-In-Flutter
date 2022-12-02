import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_39/Pages/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomePage())));
  }
  Widget build(BuildContext context) {
    return Scaffold(
    
        
        body: Container(height: double.infinity,
        width: double.infinity,
           decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/spls.jpg'),fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
               child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(120),
                  image: DecorationImage(image: AssetImage('assets/tra.gif'),fit: BoxFit.cover)),
                ),
              ),
              Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 20),
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(255, 230, 219, 230),
              color: Color.fromARGB(255, 235, 12, 4),
              strokeWidth: 6,
            )
          )
              
            ],
          ),
        ),
    );
  }
}
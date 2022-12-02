import 'package:day14/pages/camera.dart';
import 'package:day14/pages/contact.dart';
import 'package:day14/pages/galary.dart';
import 'package:day14/pages/setting_demo.dart';
import 'package:flip_box_bar_plus/flip_box_bar_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 1;

  List<Widget> pages=[ 
    CameraExampleHome(),
    HomePage(),
    GalaRY(),
    HomePage1(),
    
    ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
 backgroundColor: Colors.black,
      body:  pages[selectedIndex], //
      
      bottomNavigationBar: FlipBoxBarPlus(
        navBarHeight: 90,
       
        selectedIndex: selectedIndex,
        items: [ 
          FlipBarItem(
              icon: Icon(Icons.camera,color: Color.fromARGB(255, 241, 242, 243),),
              text: Text("CAMERA",style: GoogleFonts.abrilFatface(color: Color.fromARGB(255, 250, 247, 247)),),
              frontColor: Color.fromARGB(255, 230, 27, 20),
              backColor: Color.fromARGB(255, 12, 12, 12)),
          FlipBarItem(
              icon: Icon(Icons.contact_phone),
              text: Text("CONTACT",style: GoogleFonts.abrilFatface(color: Color.fromARGB(255, 243, 238, 238)),),
              frontColor: Colors.cyan,
              backColor: Color.fromARGB(255, 1, 51, 51)),
          FlipBarItem(
              icon: Icon(Icons.image,color: Color.fromARGB(255, 241, 242, 243),),
              text: Text("GALLERY",style: GoogleFonts.abrilFatface(color: Color.fromARGB(255, 255, 255, 255))),
              frontColor: Color.fromARGB(255, 55, 226, 12),
              backColor: Color.fromARGB(255, 17, 17, 17)),
          FlipBarItem(
              icon: Icon(Icons.people,color: Colors.lightBlue),
              text: Text("PROFILE",style: GoogleFonts.abrilFatface(color: Color.fromARGB(255, 255, 255, 255))),
              frontColor: Colors.purple,
              backColor: Color.fromARGB(255, 29, 28, 29)),

        ],
        onIndexChanged: (newIndex) {
          setState(() {
            selectedIndex = newIndex;
          });
        },
      ),
    );
  }
}
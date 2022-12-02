import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_39/Pages/signin.dart';
import 'package:travel_39/Pages/signup.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      
      body: Container(
        width: double.infinity,
        height: double.infinity,
                decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/home1.jpg'),fit: BoxFit.cover)),
    child: Padding(
      padding:  EdgeInsets.only(left: 30),
      child: Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Padding(
           padding: const EdgeInsets.only(top: 100),
           child: Text("Refresh Yourself", style:  GoogleFonts.roboto(fontSize: 25,color: Color.fromARGB(255, 40, 243, 9),),),
         ),
         Text("Epic Travel Blog", style:  GoogleFonts.abrilFatface(fontSize: 35,color: Color.fromARGB(255, 240, 237, 237),),),
       SizedBox(height: 100,),
Spacer(),
Center(
  child: MaterialButton(
   minWidth: 230.0,
   height: 50,
   shape: RoundedRectangleBorder(
  
   borderRadius: BorderRadius.circular(20.0) ),color: Color.fromARGB(255, 253, 253, 253),
  
   child: Text('SIGN  IN',
  
       style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 20.0, color: Color.fromARGB(255, 0, 12, 3))),
  
   onPressed: () {
  
     Navigator.of(context).pushReplacement(MaterialPageRoute(
  
     builder: (BuildContext context) => SignIn()));
  
   }
       ),
),
      Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0,bottom: 80),
          child: TextButton(onPressed: ()
          {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => SignUp()));

          }, child: Text("Don't Have Account?", style: GoogleFonts.abrilFatface(fontSize: 24.0, color: Color.fromARGB(255, 199, 236, 13))),),
        ),
      )
       ],
                  ),
    ),
              ),
            );
    
  }
}
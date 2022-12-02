import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_39/Pages/homepage.dart';
import 'package:travel_39/Pages/signup.dart';
import 'package:travel_39/Pages/viewpage.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailcontroller = TextEditingController();
 
  TextEditingController _passwordcontroller = TextEditingController();

  signin()async{
try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _emailcontroller.text,
    password: _passwordcontroller.text
  );
Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => ViewPage()));
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
   BuildContext dialogContext; 
    showDialog(
     
    context: context, // <<----
    barrierDismissible: false,
    builder: (BuildContext context) {
      dialogContext = context;
      return Dialog(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
           Text('${e}',style: GoogleFonts.roboto(fontWeight:FontWeight.bold,fontSize: 20,color: Color.fromARGB(255, 22, 3, 3)))
           
          ],
        ),
      );
    },
  );
  } else if (e.code == 'wrong-password') {
    BuildContext dialogContext; 
    showDialog(
     
    context: context, // <<----
    barrierDismissible: false,
    builder: (BuildContext context) {
      dialogContext = context;
      return Dialog(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
           Text('${e}',style: GoogleFonts.roboto(fontWeight:FontWeight.bold,fontSize: 20,color: Color.fromARGB(255, 22, 3, 3)))
           
          ],
        ),
      );
    },
  );
  }
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(213, 41, 163, 59),
        leading: IconButton(
          iconSize: 20,
          onPressed: (){
           Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => HomePage()));
        }, icon:Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 253, 253, 253),) ),
        title: Text('LOGIN PAGE',style: GoogleFonts.roboto(fontSize: 23.0, color: Color.fromARGB(255, 247, 244, 243),fontWeight: FontWeight.bold)),
      ),
      body: Container(
        width: double.infinity,
      height: double.infinity,
                decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/ss.png'),fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                    SizedBox(height: 8,),
                  Text("Email : ",style: GoogleFonts.abrilFatface(fontSize: 18.0, color: Color.fromARGB(255, 11, 4, 143))),
                  SizedBox(height: 8,),
                  TextFormField(
                    controller: _emailcontroller,
                    
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    style: GoogleFonts.roboto(fontSize: 20.0, color: Color.fromARGB(255, 6, 5, 27),fontWeight: FontWeight.bold) ,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Color.fromARGB(255, 2, 4, 90), width: 1),
                      ),
                      hintText: "Email",
                      hintStyle: GoogleFonts.abrilFatface(fontSize: 16.0, color: Color.fromARGB(255, 15, 2, 24))
                      ),
                    ),
                    SizedBox(height: 8,),
                  Text("Password : ",style: GoogleFonts.abrilFatface(fontSize: 18.0, color: Color.fromARGB(255, 11, 4, 143))),
                  SizedBox(height: 8,),
                  TextFormField(
                    controller: _passwordcontroller,
                    
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    style: GoogleFonts.roboto(fontSize: 20.0, color: Color.fromARGB(255, 3, 3, 15),fontWeight: FontWeight.bold) ,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Color.fromARGB(255, 2, 4, 90), width: 1),
                      ),
                      hintText: "Password",
                      hintStyle: GoogleFonts.abrilFatface(fontSize: 16.0, color: Color.fromARGB(255, 15, 2, 24))
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: MaterialButton(
                  minWidth: 200.0,
                  height: 50,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), 
              ),
                  color: Color.fromARGB(255, 6, 59, 204),
                  child: new Text('LOG  IN',
                        style: GoogleFonts.abrilFatface(fontSize: 16.0, color: Color.fromARGB(255, 250, 252, 249))),
                  onPressed: () {
                      signin();
                      setState(() {
                        _emailcontroller.clear();
                        _passwordcontroller.clear();
                      });
                  }
                    ),
                    ),
                    Center(
                      child: TextButton(onPressed: ()
                      {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => SignUp()));
            
                      }, child: Text("Don't Have Account?", style: GoogleFonts.abrilFatface(fontSize: 24.0, color: Color.fromARGB(255, 246, 0, 0))),),
                    ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_39/Pages/homepage.dart';
import 'package:travel_39/Pages/signin.dart';
import 'package:travel_39/Pages/viewpage.dart';

class SignUp extends StatefulWidget 
{
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> 
{
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _repasswordcontroller = TextEditingController();

  signup()async{
    try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _emailcontroller.text,
    password: _passwordcontroller.text,
  );

   Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));

} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    BuildContext dialogContext; 
    showDialog(  
    context: context, // <<----
    barrierDismissible: false,
    builder: (BuildContext context) {
      dialogContext = context;
      return Dialog(
        backgroundColor: Colors.blue,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
           Text('${e}',style: GoogleFonts.roboto(fontWeight:FontWeight.bold,fontSize: 20,color: Color.fromARGB(255, 18, 1, 1)))
          ],
        ),
      );
    },
  );


  } else if (e.code == 'email-already-in-use') {
    BuildContext dialogContext; 
    showDialog(  
    context: context, // <<----
    barrierDismissible: false,
    builder: (BuildContext context) {
      dialogContext = context;
      return Dialog(
        backgroundColor: Colors.blue,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
           Text('${e}',style: GoogleFonts.roboto(fontWeight:FontWeight.bold,fontSize: 20,color: Color.fromARGB(255, 20, 1, 1)))
          ],
        ),
      );
    },
  );
  }
} catch (e) {
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
  @override
    
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 7, 153, 226),
        leading: IconButton(
          iconSize: 20,
          onPressed: (){
           Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => HomePage()));
        }, icon:Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 253, 253, 253),) ),
        title: Text('SIGN UP PAGE',style: GoogleFonts.abrilFatface(fontSize: 18.0, color: Color.fromARGB(255, 247, 244, 243))),
      ),      
      body: Container(
      width: double.infinity,
      height: double.infinity,
              decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/ss.png'),fit: BoxFit.fill)),
        
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
                  SizedBox(height: 8,),
                Text("Confirm Password : ",style: GoogleFonts.abrilFatface(fontSize: 18.0, color: Color.fromARGB(255, 11, 4, 143))),
                SizedBox(height: 8,),
                TextFormField(
                  controller: _repasswordcontroller,
                  
                  textInputAction: TextInputAction.next,
                
                  obscureText: true,
                  style: GoogleFonts.roboto(fontSize: 20.0, color: Color.fromARGB(255, 3, 2, 12),fontWeight: FontWeight.bold) ,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Color.fromARGB(255, 2, 4, 90), width: 1),
                    ),
                    hintText: "Retype Password",
                    
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
                  signup();
                  setState(() {
                    _emailcontroller.clear();
                    _passwordcontroller.clear();
                    _repasswordcontroller.clear();
                  });
                }
              ),
             )
           ],
         ),
       ),
     ),
    ),
  );
 }
}
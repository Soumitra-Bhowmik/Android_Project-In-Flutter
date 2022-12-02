import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubContact extends StatefulWidget {
   SubContact({ Key? key,this.age,this.email,this.gender,this.img,this.name }) : super(key: key);

  String ?name;
  String ?img;
  String ?email;
  int ?age;
  bool ?gender;

  @override
  State<SubContact> createState() => _SubContactState();
}

class _SubContactState extends State<SubContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 80,
                   backgroundColor: Colors.teal,
                    backgroundImage: NetworkImage("${widget.img}"),
                  ),
                  Positioned(
                      right: 20,
                      bottom: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 10,
                      )),
            
                  
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text("${widget.name}",
                  style: GoogleFonts.lobster(
                      fontSize: 30,
                      color: Color.fromARGB(255, 240, 85, 14),
                      fontWeight: FontWeight.w600)),
              SizedBox(
                height: 10,
              ),
              Text(
                "AGE :${widget.age} ",
                style: GoogleFonts.merriweather(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                tileColor: Colors.grey,
                leading: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                title: Text(
                  "Email: ${widget.email}",
                  style: GoogleFonts.merriweather(color: Color.fromARGB(255, 36, 35, 35),fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                tileColor: Colors.grey,
                leading: Icon(
                  Icons.people,
                  color: Colors.black,
                ),
                title: Text(
                  "Gender: ${widget.gender==true? "Male":"Female"}",
                 style: GoogleFonts.merriweather(color: Color.fromARGB(255, 16, 2, 80),fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              
            ],
          ),
        ),
      ),
      
    );
  }
}


myStyle(double size, [Color? clr, FontWeight? fw]) {
  return GoogleFonts.roboto(fontSize: size, color: clr, fontWeight: fw);
}

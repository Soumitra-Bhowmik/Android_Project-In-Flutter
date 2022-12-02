import 'package:day14/model.dart';
import 'package:day14/pages/subcontact.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key, }) : super(key: key);

  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
      backgroundColor: Colors.indigo,
      title: Text("Contact List",style: GoogleFonts.abrilFatface(color: Colors.white,fontSize: 22),),
      leading: IconButton(onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),)),

      body: Container(
        width: double.infinity,

        child: ListView.builder( 
          itemCount: mylist.length,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
         return InkWell(
           child: Container( 
         
             decoration: BoxDecoration(color: Color.fromARGB(255, 3, 9, 92),borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(50),topRight: Radius.circular(100),bottomRight: Radius.circular(5)),
         
             boxShadow: [
                      BoxShadow(
                 color: Colors.grey.withOpacity(0.5),
                 spreadRadius: 5,
                 blurRadius: 7,
                 offset: Offset(0, 3), // changes position of shadow
                             ),
                     ],),
            
             padding: EdgeInsets.only(left: 10,top: 15),
              child: Row(
                children: [ 
                  CircleAvatar( 
                    radius: 25,
                    backgroundImage: NetworkImage("${mylist[index].img}"),
                  ),
                  SizedBox(width: 10,),
         
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${mylist[index].name}",style: GoogleFonts.merriweather(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
                       Text("${mylist[index].email}",style: GoogleFonts.merriweather(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold)),
         
                    ],
                  ),
                  Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${mylist[index].gender==true? "Male":"Female"}",style: GoogleFonts.merriweather(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
                         Text("Age:${mylist[index].age}",style: GoogleFonts.merriweather(color: Color.fromARGB(255, 255, 218, 7),fontSize: 10,fontWeight: FontWeight.bold)),
         
                      ],
                  ),
                    ),
         
                
                ],
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SubContact(
                name: mylist[index].name,
                age: mylist[index].age,
                img: mylist[index].img,
                gender: mylist[index].gender,
                email: mylist[index].email,
              )));
            },
         );
        })),
      ),
    );
  }
}
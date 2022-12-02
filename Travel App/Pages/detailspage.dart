

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key , this.details,this.name, this.token}) : super(key: key);
String ?name;
String ?token;
String ?details;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container( 
               width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage("${widget.token}"),fit: BoxFit.cover),
        ),
        
        // height:50,
        // width: 50,
        // child: Image.network("${widget.token}",fit: BoxFit.cover,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
              padding: const EdgeInsets.only(top: 40,left: 15),
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                       ),
        SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [ Icon(Icons.access_time,color: Colors.white,),
                SizedBox(width: 10,),
               Text("10 min",style: TextStyle(color: Colors.white),),],
              ),
            ),
        
               Padding(
                 padding: const EdgeInsets.only(top: 25),
                 child: Container(
                  decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(55),topRight: Radius.circular(55)),
                    
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text("${widget.details}",style:
                                                          GoogleFonts.merriweather(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 20,
                                                              color: Color.fromARGB(248, 9, 0, 22)),),
                  ),
                  ),
               )
            ],
          ),
        ),
           ),
    );
  }
}

//  body: Container( 
//                width: double.infinity,
//         decoration: BoxDecoration(
//             image: DecorationImage(image: NetworkImage("${widget.token}"),fit: BoxFit.cover),
//         ),
        
//         // height:50,
//         // width: 50,
//         // child: Image.network("${widget.token}",fit: BoxFit.cover,),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//                Expanded(flex: 2,
//                  child: Padding(
//                  padding: const EdgeInsets.only(top: 40,left: 15),
//                  child: IconButton(onPressed: (){
//                    Navigator.pop(context);
//                  }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
//                           ),
//                ),
        
//              Expanded(flex: 5,
//                child: Container(child: Column(
//                  children: [
//                    Text("")
//                  ],
//                ),)),
        
//                SingleChildScrollView(
//                  child: Expanded(flex: 9,
//                  child: Container(
//                   decoration: BoxDecoration(color: Colors.white,
//                     borderRadius: BorderRadius.only(topLeft: Radius.circular(55),topRight: Radius.circular(55)),
                    
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(25.0),
//                     child: Text("${widget.details}",style:
//                                                           GoogleFonts.merriweather(
//                                                               fontWeight:
//                                                                   FontWeight.bold,
//                                                               fontSize: 20,
//                                                               color: Color.fromARGB(248, 9, 0, 22)),),
//                   ),
//                   ),
//                    ),
//                )
//             ],
//           ),
//         ),
//            ),





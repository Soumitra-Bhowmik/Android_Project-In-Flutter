import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_39/Pages/detailspage.dart';
import 'package:travel_39/Pages/homepage.dart';
import 'package:travel_39/Pages/signin.dart';

class ViewPage extends StatefulWidget {
  ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(241, 228, 250, 231),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            iconSize: 20,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: ((context) => SignIn())));
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
      ),

      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 23, 5, 5),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80'),
                  ),
                  title: Text(
                    'Soumitra Bhowmik',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Color.fromARGB(255, 243, 198, 198)),
                  ),
                )),
            ListTile(
              leading: Icon(
                Icons.route,
              ),
              title: const Text('Travel Route 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.route,
              ),
              title: const Text('Travel Route 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

// body: Padding(
//   padding: const EdgeInsets.all(15.0),
//   child:   Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//     children: [

//       Text("Your Daily",style: GoogleFonts.abrilFatface(fontSize: 18.0, color: Color.fromARGB(255, 71, 70, 70))),
//       Text("Recommendation",style: GoogleFonts.abrilFatface(fontSize: 20.0, color: Color.fromARGB(255, 10, 1, 1))),

//        Container(
//         child: StreamBuilder(
//             stream: FirebaseFirestore.instance.collection('Users').snapshots(),
//             builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                     itemCount: snapshot.data?.docs.length,
//                     itemBuilder: (context, index) => Container(
//                           height: 60,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.lightBlue),
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: 110,
//                                 child: Text(snapshot.data?.docs[index]['name']),
//                               ),
//                               Container(
//                                 width: 110,
//                                 child:
//                                     Text(snapshot.data?.docs[index]['email']),
//                               ),
//                               Container(
//                                 width: 110,
//                                 child: Text(
//                                     snapshot.data?.docs[index]['password']),
//                               )
//                             ],
//                           ),
//                         ));
//               } else {
//                 return Container(
//                   color: Colors.black12,
//                 );
//               }
//             }),
//       ),

//     ],
//   ),
// ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text("Your Daily",
                  style: GoogleFonts.abrilFatface(
                      fontSize: 18.0, color: Color.fromARGB(255, 71, 70, 70))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text("Recommendation",
                  style: GoogleFonts.abrilFatface(
                      fontSize: 20.0, color: Color.fromARGB(255, 10, 1, 1))),
            ),
            Container(
              height: 400,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Users')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailPage(
                                                    name: snapshot.data
                                                        ?.docs[index]['name'],
                                                    details: snapshot
                                                            .data?.docs[index]
                                                        ['details'],
                                                    token: snapshot.data
                                                        ?.docs[index]['token'],
                                                  )));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.green
                                                    .withOpacity(0.7),
                                                spreadRadius: 3,
                                                blurRadius: 15,
                                                offset: Offset(0,
                                                    5), // changes position of shadow
                                              ),
                                            ],
                                            color: Color.fromARGB(
                                                218, 240, 236, 178),
                                            image: DecorationImage(
                                                image: NetworkImage(snapshot
                                                    .data
                                                    ?.docs[index]['token']),
                                                fit: BoxFit.fill)),
                                        height: 250,
                                        width: 180,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                                bottom: 40,
                                                left: 10,
                                                child: Text(
                                                  snapshot.data?.docs[index]
                                                      ['title'],
                                                  style:
                                                      GoogleFonts.merriweather(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              248,
                                                              252,
                                                              250,
                                                              255)),
                                                )),
                                            Positioned(
                                              bottom: 5,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 10,bottom: 5),
                                                child: Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 10,
                                                      backgroundImage: NetworkImage(
                                                          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80'),
                                                    ),
                                                    SizedBox(width: 5,),
                                                    Text(
                                                      snapshot.data?.docs[index]
                                                          ['name'],
                                                      style: GoogleFonts
                                                          .merriweather(
                                                              fontSize: 15,
                                                              color:
                                                                  Color.fromARGB(248, 254, 253, 255)),
                                                    ),
                                                    SizedBox(width: 5,),
                                                    Icon(Icons.access_time,color: Colors.white,)
                                                  ],
                                                ),
                                              ),
                                            )
                                            //  Positioned( top: 10,
                                            //    child: ListTile(
                                            //      leading: CircleAvatar(backgroundImage: NetworkImage(snapshot.data?.docs[index]['token']),),
                                            //    ),
                                            //  )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 6,
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        color: Colors.black12,
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

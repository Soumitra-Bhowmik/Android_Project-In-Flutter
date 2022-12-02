import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DETAILS"),
      ),
      body: Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Users').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) => Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.lightBlue),
                          child: Row(
                            children: [
                              Container(
                                width: 110,
                                child: Text(snapshot.data?.docs[index]['name']),
                              ),
                              Container(
                                width: 110,
                                child:
                                    Text(snapshot.data?.docs[index]['email']),
                              ),
                              Container(
                                width: 110,
                                child: Text(
                                    snapshot.data?.docs[index]['password']),
                              )
                            ],
                          ),
                        ));
              } else {
                return Container(
                  color: Colors.black12,
                );
              }
            }),
      ),
    );
  }
}

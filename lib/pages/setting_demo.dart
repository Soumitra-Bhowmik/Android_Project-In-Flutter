import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({Key? key}) : super(key: key);

  

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
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png"),
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
              Text("Soumitra Bhowmik",
                  style: GoogleFonts.lobster(
                      fontSize: 30,
                      color: Colors.teal,
                      fontWeight: FontWeight.w600)),
              SizedBox(
                height: 10,
              ),
              Text(
                "App Developer",
                style: myStyle(20, Colors.white, FontWeight.w600),
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
                  "soumitra.molay@gmail.com",
                  style: myStyle(20, Colors.black87, FontWeight.w600),
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
                  Icons.call,
                  color: Colors.black,
                ),
                title: Text(
                  "01701046771",
                  style: myStyle(20, Colors.black87, FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      "https://pbs.twimg.com/profile_images/1455185376876826625/s1AjSxph_400x400.jpg",
                      height: 30,
                      width: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMgYa3RUsf5RfU_SHlV6NPhwVYCrglicqh5g&usqp=CAU",
                        height: 30,
                        width: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      "data:image/png;base64,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",
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              )
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

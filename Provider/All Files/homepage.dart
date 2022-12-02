import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sakir_exam_3/All%20Files/details.dart';

import 'Model/model.dart';
import 'http.dart';

// Text(_userModel![index].id.toString()),
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Model>? _userModel = [];
  Model? alluser;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await CustomHttpRequest().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          leading: Row(
            children: [
            Icon(Icons.settings),
            Icon(Icons.filter)
          ],),
          centerTitle: true,
          title:Text('My Artworks', ),
          actions: [
            Icon(Icons.settings),
          ],
          
        ),
        body: _userModel == null || _userModel!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                itemCount: _userModel!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {

                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(
                    //model:  _userModel![index].downloadUrl.toString(),
                    model: _userModel![index],
                   )));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      height: 150,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            Image.network(
                              _userModel![index].downloadUrl.toString(),
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Positioned(
                              bottom: 5,
                              left: 10,
                              child: Text(
                                _userModel![index].author.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ));
  }
}

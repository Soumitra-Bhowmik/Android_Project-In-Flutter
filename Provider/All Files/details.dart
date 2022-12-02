import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'Model/model.dart';

class Details extends StatefulWidget {
   Details({Key? key, this.model}) : super(key: key);
//final String ?downloadUrl;
Model ?model;
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(),
          body: Container(height: double.infinity,width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage("${widget.model!.downloadUrl}"),fit: BoxFit.cover )
            ),
          ),
    );
    
  }
}
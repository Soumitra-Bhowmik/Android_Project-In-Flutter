import 'dart:convert';
import 'package:admin_app/http/custome_http_request.dart';
import 'package:admin_app/model/order_model.dart';
import 'package:admin_app/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<OrderProvider>(context, listen: false).getOrderData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<OrderProvider>(context);
    return Scaffold(
      body: ListView.builder(
          itemCount: categories.orderData.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              child: Text(
                  "${categories.orderData[index].orderStatus!.orderStatusCategory!.name}"),
            );
          }),
    );
  }
}

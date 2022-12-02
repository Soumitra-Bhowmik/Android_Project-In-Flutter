import 'package:admin_app/provider/category_provider.dart';
import 'package:admin_app/provider/order_provider.dart';
import 'package:admin_app/provider/product_provider.dart';
import 'package:admin_app/screen/login_page.dart';
import 'package:admin_app/screen/registation_page.dart';
import 'package:admin_app/tab_item/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<OrderProvider>(
      create: (_) => OrderProvider(),
    ),
    ChangeNotifierProvider<CategoryProvider>(
      create: (_) => CategoryProvider(),
    ),
    ChangeNotifierProvider<ProductProvider>(
      create: (_) => ProductProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: LoginPage());
  }
}

import 'package:admin_app/http/custome_http_request.dart';
import 'package:admin_app/model/category_model.dart';
import 'package:admin_app/model/order_model.dart';
import 'package:admin_app/model/products_model.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> productList = [];

  getproductData() async {
    productList = await CustomHttpRequest().fetchProductData();
    notifyListeners();
  }
}

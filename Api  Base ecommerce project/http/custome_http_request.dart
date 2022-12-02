import 'dart:convert';

import 'package:admin_app/model/category_model.dart';
import 'package:admin_app/model/order_model.dart';
import 'package:admin_app/model/products_model.dart';
import 'package:admin_app/widget/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CustomHttpRequest {
  static const Map<String, String> defaultHeader = {
    "Accept": "application/json",
    "Authorization":
        "bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpaG9tZWNoZWYuYW50b3BvbGlzLnh5elwvYXBpXC9hZG1pblwvc2lnbi1pbiIsImlhdCI6MTY1NDAwNzYwNiwiZXhwIjoxNjY2OTY3NjA2LCJuYmYiOjE2NTQwMDc2MDYsImp0aSI6IjlLWGFGNmRFdlgwWVNZVzIiLCJzdWIiOjUwLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.Cbii274lgjkMIf2Ix9fZ7e8HPAT47B5MV0QP03Rd520",
  };

  late SharedPreferences sharedPreferences;

  Future<Map<String, String>> getHeaderWithToken() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var header = {
      "Accept": "application/json",
      "Authorization": "bearer ${sharedPreferences.getString("token")}",
    };
    print("Token is ${sharedPreferences.getString("token")} ");

    return header;
  }

  fetchOrderData() async {
    List<OrderModel> orderData = [];
    late OrderModel orderModel;
    var responce = await http.get(
        Uri.parse("https://apihomechef.antopolis.xyz/api/admin/all/orders"),
        headers: await CustomHttpRequest().getHeaderWithToken());
    if (responce.statusCode == 200) {
      var data = jsonDecode(responce.body);
      print("Order list are $data");
      for (var item in data) {
        orderModel = OrderModel.fromJson(item);

        orderData.add(orderModel);
      }
    }
    return orderData;
  }

  fetchCategoryData() async {
    List<CategoryModel> categoryList = [];
    late CategoryModel categoryModel;
    var responce = await http.get(
        Uri.parse("https://apihomechef.antopolis.xyz/api/admin/category"),
        headers: await CustomHttpRequest().getHeaderWithToken());
    if (responce.statusCode == 200) {
      var data = jsonDecode(responce.body);
      print("Order list are $data");
      for (var item in data) {
        categoryModel = CategoryModel.fromJson(item);

        categoryList.add(categoryModel);
      }
    }
    return categoryList;
  }

  static deleteCategory(int id) async {
    var responce = await http.delete(
        Uri.parse(
            "https://apihomechef.antopolis.xyz/api/admin/category/$id/delete"),
        headers: await CustomHttpRequest().getHeaderWithToken());

    if (responce.statusCode == 200) {
      print("Status code is ${responce.statusCode}");
      showInToast("Category item deleted successfull");
    } else {
      showInToast("Something went worng, try again");
    }
  }

  fetchProductData() async {
    List<ProductModel> productList = [];
    late ProductModel productModel;
    var responce = await http.get(
        Uri.parse("https://apihomechef.antopolis.xyz/api/admin/products"),
        headers: await CustomHttpRequest().getHeaderWithToken());
    if (responce.statusCode == 200) {
      var data = jsonDecode(responce.body);
      print("Product list $data");
      for (var i in data) {
        productModel = ProductModel.fromJson(i);
        productList.add(productModel);
      }
    }
    return productList;
  }

  static Future<dynamic> getCategoriesDropDown() async {
    try {
      String url = "https://apihomechef.antopolis.xyz/api/admin/category";
      Uri myUri = Uri.parse(url);
      http.Response response = await http.get(myUri,
          headers: await CustomHttpRequest().getHeaderWithToken());
      if (response.statusCode == 200) {
        print(response);
        return response;
      } else
        return "Error";
    } catch (e) {
      print(e);
      return "Something Wrong...!!!";
    }
  }
}

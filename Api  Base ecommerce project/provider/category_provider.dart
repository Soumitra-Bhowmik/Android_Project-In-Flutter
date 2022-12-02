import 'package:admin_app/http/custome_http_request.dart';
import 'package:admin_app/model/category_model.dart';
import 'package:admin_app/model/order_model.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> categoryList = [];

  getCategoryData() async {
    categoryList = await CustomHttpRequest().fetchCategoryData();
    notifyListeners();
  }
}

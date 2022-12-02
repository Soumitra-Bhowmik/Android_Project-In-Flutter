import 'package:admin_app/http/custome_http_request.dart';
import 'package:admin_app/model/order_model.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> orderData = [];

  getOrderData() async {
    orderData = await CustomHttpRequest().fetchOrderData();
    notifyListeners();
  }
}

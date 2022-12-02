import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Model/model.dart';
import 'http.dart';


class DisplayProvider with ChangeNotifier {
  List<Model> modelList = [];
  late Model userModel;

  getCategory() async {
    modelList = (await CustomHttpRequest().getUsers())!;
    notifyListeners();
  }
}

import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'Model/model.dart';




class CustomHttpRequest {
  Future<List<Model>?> getUsers() async {
    try {
      var url = Uri.parse(
          'https://picsum.photos/v2/list?fbclid=IwAR2qk2kE60PcFr1S3OdDKwH9v6bhfWzmIaByJTvViW2iVnLMtDC4Lg7IyeI');
      var response = await http.get(url);
      headers:
      await CustomHttpRequest();

      if (response.statusCode == 200) {
        List<Model> _model = modelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/model.dart';

class NewsController extends GetxController {
  RxInt currentIndex = 0.obs;
  getData(String cate) async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&category=${cate}&apiKey=f8e20f916e2c49bdb93fa1c10104e2cc');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        return Articles.fromJson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar("error", e.toString());
      }
    }
  }

  // static Future<Articles> fetchAlbum() async {
  //   final response = await http.get(
  // Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&apiKey=f8e20f916e2c49bdb93fa1c10104e2cc'));
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     var data = json.decode(response.body);
  //     return Articles.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }

}

import 'dart:convert';

import 'package:get/get.dart';
import 'package:wedding_card/controllers/home_controller.dart';
import 'package:wedding_card/models/wish_model.dart';
import 'package:http/http.dart' as http;

class WishApis {
  static Future<List<WishModel>> fetchData() async {
    final response = await http
        .get(Uri.parse('http://wed-api.mirulazam.store/api/fetch-wish'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)["data"] as List;
      // print(data);
      return data
          .map((item) => WishModel(
                id: item['id'],
                nama: item['nama'],
                komen: item['komen'],
              ))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  static Future addApiData() async {
    // final connect = GetConnect();
    final HomeController controller = Get.put(HomeController());
    // print(controller.power.value);
    // print(controller.powerTextController.value?.text);
    // print("apis");
    final response = await http.post(
      Uri.parse('http://wed-api.mirulazam.store/api/save-wish'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, Object>{
        'nama': controller.ucapanNama.value,
        'komen': controller.ucapanKomen.value
      }),
    );
    // print(response.statusCode);

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print('Data added successfully');
      return true;
    } else {
      throw Exception('Failed to add');
    }
  }
}

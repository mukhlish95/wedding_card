import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import '../controllers/home_controller.dart';

class RsvpApis {
  static Future addApiData() async {
    // final connect = GetConnect();
    final HomeController controller = Get.put(HomeController());
    // print(controller.power.value);
    // print(controller.powerTextController.value?.text);
    // print("apis");
    final response = await http.post(
      Uri.parse('https://wed-api.mirulazam.store/api/save-rsvp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, Object>{
        'nama': controller.namaRsvp.value,
        'no_tel': controller.notelRsvp.value,
        'kehadiran': controller.kehadiran.value
      }),
    );
    // print(response.statusCode);

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      Get.back();
      print('Data added successfully');
      return true;
    } else {
      throw Exception('Failed to add');
    }
  }
}

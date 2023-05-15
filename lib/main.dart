import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_card/bindings/home_binding.dart';

import 'views/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Ekad Amirul Mukhlish & Fazirah",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen(), binding: HomeBinding()),
      ],
    );
  }
}

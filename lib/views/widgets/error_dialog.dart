import 'dart:ui';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

ErrorDialog() {
  Get.defaultDialog(
      middleText: "Sila isikan maklumat",
      backgroundColor: Color.fromARGB(255, 230, 150, 150),
      middleTextStyle: TextStyle(color: Color.fromARGB(255, 90, 3, 3)),
      titlePadding: EdgeInsets.all(0),
      contentPadding: EdgeInsets.all(0),
      radius: 70);
  Future.delayed(Duration(seconds: 1), () => Get.back());
}

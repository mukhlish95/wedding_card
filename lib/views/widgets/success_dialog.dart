import 'dart:ui';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

SuccessDialog() {
  Get.defaultDialog(
      middleText: "Save Success",
      backgroundColor: Color.fromARGB(255, 178, 236, 173),
      middleTextStyle: TextStyle(color: Color.fromARGB(255, 11, 90, 3)),
      titlePadding: EdgeInsets.all(0),
      contentPadding: EdgeInsets.all(0),
      radius: 70);
  Future.delayed(Duration(seconds: 1), () => Get.back());
}

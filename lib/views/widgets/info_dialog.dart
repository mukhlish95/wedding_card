import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

InfoDialog() {
  final player = AudioPlayer();
  Get.defaultDialog(
      title: "",
      middleText: "",
      content: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 230,
            width: 300,
            child: ListView(
              children: [
                Text(
                  "Created by",
                  textAlign: TextAlign.center,
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Amirul Mukhlish'),
                  subtitle: Text('Developer'),
                ),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text('Services'),
                  subtitle: Text('Web and Mobile app services'),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Contacts'),
                  subtitle: SelectableText('601135515539'),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 218, 165, 6),
      middleTextStyle: TextStyle(color: Color.fromARGB(255, 90, 3, 3)),
      titlePadding: EdgeInsets.all(10),
      contentPadding: EdgeInsets.all(0),
      radius: 70);
  // Future.delayed(Duration(seconds: 1), () => Get.back());
}

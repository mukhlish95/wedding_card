import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

InfoDialog() {
  final player = AudioPlayer();
  Get.defaultDialog(
      title: "",
      middleText: "",
      content: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 240,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  _launchURL_apiLogin();
                },
                label: Text(
                  "Login",
                  style: TextStyle(color: Color.fromARGB(255, 12, 75, 127)),
                ),
                icon: Icon(Icons.login),
                style: ButtonStyle(
                    iconColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 12, 75, 127))),
              )
            ],
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 218, 165, 6),
      middleTextStyle: TextStyle(color: Color.fromARGB(255, 90, 3, 3)),
      titlePadding: EdgeInsets.all(0),
      contentPadding: EdgeInsets.all(0),
      radius: 70);
  // Future.delayed(Duration(seconds: 1), () => Get.back());
}

_launchURL_apiLogin() async {
  // print("test");
  const url = 'https://wed-api.mirulazam.store/wish/index';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri))
    return await launchUrl(uri);
  else
    // can't launch url, there is some error
    return throw "Could not launch $uri";
}

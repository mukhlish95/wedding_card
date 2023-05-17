// import 'package:audioplayers/audioplayers.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

AudioDialog() {
  // final player = AudioPlayer();
  Get.defaultDialog(
      title: "Play Music",
      middleText: "",
      content: Column(
        children: [
          // Text("Play Music"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 0, 11, 109))),
                onPressed: () async {
                  // final assetsAudioPlayer = AssetsAudioPlayer();
                  AssetsAudioPlayer.playAndForget(Audio("sounds/selawat.mp3"));

                  Get.back();
                },
                label: Text("Play"),
                icon: Icon(
                  Icons.play_arrow,
                  // size: 30,
                ),
                // label: Text("Play")
              ),
              Padding(padding: EdgeInsets.all(5)),
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 0, 11, 109))),
                onPressed: () => Get.back(),
                icon: Icon(Icons.stop),
                label: Text("Close"),
              )
            ],
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

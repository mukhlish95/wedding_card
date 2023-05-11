import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_card/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    // set default unselected
    controller.selectedIndex.value = 2;
    return Stack(children: <Widget>[
      Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
                constraints: BoxConstraints(minWidth: 300, maxWidth: 440),
                // width: 500,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset("images/1.png"),
                      Image.asset("images/2.png"),
                      Image.asset("images/3.png"),
                      Image.asset("images/4.png"),
                      Image.asset("images/5.png"),
                    ],
                  ),
                )),
          ),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              showSelectedLabels: true,
              showUnselectedLabels: true,
              unselectedItemColor: Color.fromARGB(255, 255, 211, 100),
              backgroundColor: Color.fromARGB(255, 19, 1, 102),
              iconSize: 30,
              unselectedFontSize: 12,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.location_on_outlined,
                    // color: Colors.blueAccent,
                  ),
                  label: 'Lokasi',
                  backgroundColor: Color.fromARGB(255, 20, 1, 105),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calendar_month_outlined,
                    // color: Colors.blueAccent,
                  ),
                  label: 'Kalendar',
                  backgroundColor: Color.fromARGB(255, 20, 1, 105),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.call,
                    // color: Colors.blueAccent,
                  ),
                  label: 'Hubungi',
                  backgroundColor: Color.fromARGB(255, 20, 1, 105),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.note_alt_outlined,
                    // color: Colors.blueAccent,
                  ),
                  label: 'Kehadiran',
                  backgroundColor: Color.fromARGB(255, 20, 1, 105),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat_outlined,
                    // color: Colors.blueAccent,
                  ),
                  label: 'Ucapan',
                  backgroundColor: Color.fromARGB(255, 20, 1, 105),
                ),
              ],
              currentIndex: controller.selectedIndex.value,
              selectedItemColor: Color.fromARGB(255, 214, 214, 214),
              onTap: controller.onItemTapped,
            ),
          ))
    ]);
  }
}
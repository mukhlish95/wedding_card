import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_card/controllers/home_controller.dart';
import 'package:wedding_card/views/widgets/info_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    // set default unselected
    controller.selectedIndex.value = 2;
    return Stack(children: <Widget>[
      Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: IconButton(
            icon: Icon(
              Icons.info,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 40,
            ),
            // style: ButtonStyle(
            //     iconColor: MaterialStatePropertyAll(
            //         Color.fromARGB(255, 255, 255, 255)),
            //     backgroundColor: MaterialStateProperty.all(Colors.amber)),
            onPressed: () {
              InfoDialog();
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
                constraints: BoxConstraints(minWidth: 200, maxWidth: 440),
                // width: 500,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset("images/1.gif"),
                      Image.asset("images/2.gif"),
                      Image.asset("images/3.gif"),
                      Image.asset("images/4.gif"),
                      Image.asset("images/5.gif"),
                    ],
                  ),
                )),
          ),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              showSelectedLabels: true,
              showUnselectedLabels: true,
              unselectedItemColor: Color.fromARGB(255, 255, 211, 100),
              backgroundColor: Color.fromARGB(255, 1, 47, 45),
              iconSize: 30,
              unselectedFontSize: 12,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.location_on_outlined,
                    // color: Colors.blueAccent,
                  ),
                  label: 'Lokasi',
                  backgroundColor: Color.fromARGB(255, 1, 47, 45),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calendar_month_outlined,
                    // color: Colors.blueAccent,
                  ),
                  label: 'Kalendar',
                  backgroundColor: Color.fromARGB(255, 1, 47, 45),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.call,
                    // color: Colors.blueAccent,
                  ),
                  label: 'Hubungi',
                  backgroundColor: Color.fromARGB(255, 1, 47, 45),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.note_alt_outlined,
                    // color: Colors.blueAccent,
                  ),
                  label: 'Kehadiran',
                  backgroundColor: Color.fromARGB(255, 1, 47, 45),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat_outlined,
                    // color: Colors.blueAccent,
                  ),
                  label: 'Ucapan',
                  backgroundColor: Color.fromARGB(255, 1, 47, 45),
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

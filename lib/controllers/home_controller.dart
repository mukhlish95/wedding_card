import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void onItemTapped(int index) {
    {
      selectedIndex(index);
      String? _selectedOption;
      switch (index) {
        case 0:
          // print("0");
          Get.defaultDialog(
              title: "Lokasi Majlis",
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: _launchURL_gmaps,
                        icon: Image.asset(
                          "/icons/gmaps.png",
                          fit: BoxFit.scaleDown,
                        ),
                        iconSize: 40,
                      ),
                      Text("Google Maps")
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: _launchURL_waze,
                        icon: Image.asset(
                          "/icons/waze.png",
                          fit: BoxFit.scaleDown,
                        ),
                        iconSize: 40,
                      ),
                      Text("Waze")
                    ],
                  )
                ],
              ),
              backgroundColor: Color.fromARGB(217, 202, 146, 87),
              titleStyle: TextStyle(color: Colors.white),
              middleTextStyle: TextStyle(color: Colors.white),
              radius: 30);
          break;
        case 1:
          Get.defaultDialog(
              title: "Kalendar",
              content: Column(
                children: [
                  Text("27-OGOS-2023"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TimerCountdown(
                      format: CountDownTimerFormat.daysHoursMinutesSeconds,
                      endTime: dateCount(),
                      daysDescription: "Hari",
                      hoursDescription: "Jam",
                      minutesDescription: "Minit",
                      secondsDescription: "Saat",
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: _launchURL_addToGCalender,
                            child: Text("Add to Google Calender")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: _launchURL_addToACalender,
                            child: Text("Add to Apple Calender")),
                      )
                    ],
                  )
                ],
              ),
              backgroundColor: Color.fromARGB(217, 202, 146, 87),
              titleStyle: TextStyle(color: Colors.white),
              middleTextStyle: TextStyle(color: Colors.white),
              radius: 30);
          break;
        case 2:
          Get.defaultDialog(
              title: "Hubungi",
              content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SelectableText("Piut - 0178214402"),
                      IconButton(
                        onPressed: _launchURL_call_bapa,
                        icon: Icon(Icons.call),
                        color: Colors.indigo,
                      ),
                      IconButton(
                        onPressed: _launchURL_whatsapp_bapa,
                        icon: Image.asset(
                          "/icons/WA.png",
                          width: 30,
                          color: Colors.lightGreenAccent,
                        ),
                      ),
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SelectableText("Kalsom - 0135519044"),
                      IconButton(
                        onPressed: _launchURL_call_mama,
                        icon: Icon(Icons.call),
                        color: Colors.indigo,
                      ),
                      IconButton(
                        onPressed: _launchURL_whatsapp_mama,
                        icon: Image.asset(
                          "/icons/WA.png",
                          width: 30,
                          color: Colors.lightGreenAccent,
                        ),
                      ),
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SelectableText("Amirul - 0133227605"),
                      IconButton(
                        onPressed: _launchURL_call_mirul,
                        icon: Icon(Icons.call),
                        color: Colors.indigo,
                      ),
                      IconButton(
                        onPressed: _launchURL_whatsapp_mirul,
                        icon: Image.asset(
                          "/icons/WA.png",
                          width: 30,
                          color: Colors.lightGreenAccent,
                        ),
                        // label: Text("Whatsapp")
                      ),
                    ]),
                  ]),
              backgroundColor: Color.fromARGB(217, 202, 146, 87),
              titleStyle: TextStyle(color: Colors.white),
              middleTextStyle: TextStyle(color: Colors.white),
              radius: 30);
          break;
        case 3:
          Get.defaultDialog(
              title: "Maklum Kehadiran",
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        // controller: _controller1,
                        decoration: const InputDecoration(
                          hintText: 'Nama',
                        ),
                      ),
                      TextField(
                        // controller: _controller2,
                        decoration: const InputDecoration(hintText: 'No Tel'),
                      ),
                      RadioListTile<String>(
                        title: const Text('Tidak Hadir'),
                        value: 'Option 1',
                        groupValue: _selectedOption,
                        onChanged: (String? value) {
                          (() {
                            _selectedOption = value;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Seorang'),
                        value: 'Option 2',
                        groupValue: _selectedOption,
                        onChanged: (String? value) {
                          (() {
                            _selectedOption = value;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Sekeluarga'),
                        value: 'Option 3',
                        groupValue: _selectedOption,
                        onChanged: (String? value) {
                          (() {
                            _selectedOption = value;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Hantar'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              backgroundColor: Color.fromARGB(217, 202, 146, 87),
              titleStyle: TextStyle(color: Colors.white),
              middleTextStyle: TextStyle(color: Colors.white),
              radius: 30);
          break;
        case 4:
          Get.defaultDialog(
              title: "Ucapan",
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      // controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    flex: 3,
                    child: TextField(
                      minLines: 1,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      // controller: _commentController,
                      decoration: const InputDecoration(
                        hintText: 'Comment',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // final String name = _nameController.text;
                      // final String comment = _commentController.text;
                      // setState(() {
                      //   _comments.add(Comment(name: name, comment: comment));
                      // });
                      // _nameController.clear();
                      // _commentController.clear();
                    },
                    icon: const Icon(Icons.send),
                  ),
                ]),
              ),
              backgroundColor: Color.fromARGB(217, 239, 239, 239),
              titleStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              middleTextStyle: TextStyle(color: Colors.white),
              radius: 30);
          break;
      }
    }
  }
}

dateCount() {
  DateTime nowDate = DateTime.now();
  final DateTime _eventDate = DateTime(2023, 8, 27);
  return _eventDate;
}

_launchURL_gmaps() async {
  // print("test");
  const url = 'https://maps.app.goo.gl/mThg5tKFX6pQaZgV7';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri))
    return await launchUrl(uri);
  else
    // can't launch url, there is some error
    return throw "Could not launch $uri";
}

_launchURL_waze() async {
  // print("test");
  const url = 'https://waze.com/ul/hw8fq3kn29';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri))
    return await launchUrl(uri);
  else
    // can't launch url, there is some error
    return throw "Could not launch $uri";
}

_launchURL_addToGCalender() async {
  // print("test");
  const url =
      'https://calendar.google.com/calendar/event?action=TEMPLATE&tmeid=NXE5MGxnM3RmMmNsOTRmMXU4cWQ1aDBsdHAgbXVraGxpc2g5OUBt&tmsrc=mukhlish99%40gmail.com';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri))
    return await launchUrl(uri);
  else
    // can't launch url, there is some error
    return throw "Could not launch $uri";
}

_launchURL_addToACalender() async {
  // print("test");
  const url =
      'https://calendar.google.com/calendar/event?action=TEMPLATE&tmeid=NXE5MGxnM3RmMmNsOTRmMXU4cWQ1aDBsdHAgbXVraGxpc2g5OUBt&tmsrc=mukhlish99%40gmail.com';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri))
    return await launchUrl(uri);
  else
    // can't launch url, there is some error
    return throw "Could not launch $uri";
}

_launchURL_whatsapp_bapa() async {
  // print("test");
  const url = 'https://wa.me/60178214402';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri))
    return await launchUrl(uri);
  else
    // can't launch url, there is some error
    return throw "Could not launch $uri";
}

_launchURL_whatsapp_mama() async {
  // print("test");
  const url = 'https://wa.me/60135519044';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri))
    return await launchUrl(uri);
  else
    // can't launch url, there is some error
    return throw "Could not launch $uri";
}

_launchURL_whatsapp_mirul() async {
  // print("test");
  const url = 'https://wa.me/60133227605';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri))
    return await launchUrl(uri);
  else
    // can't launch url, there is some error
    return throw "Could not launch $uri";
}

_launchURL_call_bapa() async {
  final call = Uri.parse('tel:0178214402');
  if (await canLaunchUrl(call))
    return launchUrl(call);
  else
    // can't launch url, there is some error
    return throw "Could not launch $call";
}

_launchURL_call_mama() async {
  // print("test");
  final call = Uri.parse('tel:0135519044');
  if (await canLaunchUrl(call))
    return launchUrl(call);
  else
    // can't launch url, there is some error
    return throw "Could not launch $call";
}

_launchURL_call_mirul() async {
  // print("test");
  final call = Uri.parse('tel:0133227605');
  if (await canLaunchUrl(call))
    return launchUrl(call);
  else
    // can't launch url, there is some error
    return throw "Could not launch $call";
}

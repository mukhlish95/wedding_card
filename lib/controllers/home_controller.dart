import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wedding_card/apis/rsvp_apis.dart';
import 'package:wedding_card/apis/wish_apis.dart';
import 'package:wedding_card/models/wish_model.dart';
import 'package:wedding_card/views/widgets/error_dialog.dart';
import 'package:wedding_card/views/widgets/success_dialog.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxString selectedOption = "".obs;
  RxString kehadiran = "".obs;
  RxString namaRsvp = "".obs;
  RxString notelRsvp = "".obs;
  RxString ucapanKomen = "".obs;
  RxString ucapanNama = "".obs;
  //list of data
  RxList dataList = <WishModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  var isLoading = true.obs;

  void fetchData() async {
    // print(editForm_1.text);
    try {
      isLoading(true);
      var data = await WishApis.fetchData();
      dataList.assignAll(data);
    } finally {
      isLoading(false);
    }
  }

  void onItemTapped(int index) {
    {
      selectedIndex(index);

      switch (index) {
        case 0:
          // print("0");
          Get.defaultDialog(
              title: "",
              titlePadding: EdgeInsets.all(0),
              content: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      SizedBox(
                          // flex: 1,
                          child: Text(
                        "Lokasi Majlis",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 67, 42, 21),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: Get.back,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
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
                ],
              ),
              backgroundColor: Color.fromARGB(217, 202, 146, 87),
              titleStyle: TextStyle(color: Colors.white, fontSize: 0),
              middleTextStyle: TextStyle(color: Colors.white),
              radius: 30);
          break;
        case 1:
          Get.defaultDialog(
              title: "",
              titlePadding: EdgeInsets.all(0),
              content: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      SizedBox(
                          // flex: 1,
                          child: Text(
                        "Kalendar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 67, 42, 21),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: Get.back,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: _launchURL_addToGCalender,
                            child: Text("Add to Google Calender"),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Color.fromARGB(255, 2, 0, 131)))),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: _launchURL_addToACalender,
                            child: Text("Add to Apple Calender"),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Color.fromARGB(255, 2, 0, 131)))),
                      )
                    ],
                  )
                ],
              ),
              backgroundColor: Color.fromARGB(217, 202, 146, 87),
              titleStyle: TextStyle(color: Colors.white, fontSize: 0),
              middleTextStyle: TextStyle(color: Colors.white),
              radius: 30);
          break;
        case 2:
          Get.defaultDialog(
              title: "",
              titlePadding: EdgeInsets.all(0),
              content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        SizedBox(
                            // flex: 1,
                            child: Text(
                          "Hubungi",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Color.fromARGB(255, 67, 42, 21),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: Get.back,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SelectableText("Encik Piut - 0178214402"),
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
                      SelectableText("Puan Kalsom - 0135519044"),
                      const IconButton(
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
                      SelectableText("Encik Amirul - 0133227605"),
                      const IconButton(
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
              titleStyle: TextStyle(color: Colors.white, fontSize: 0),
              middleTextStyle: TextStyle(color: Colors.white),
              radius: 30);
          break;
        case 3:
          Get.defaultDialog(
              title: "",
              titlePadding: EdgeInsets.all(0),
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          SizedBox(
                              // flex: 1,
                              child: Text(
                            "Kehadiran",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Color.fromARGB(255, 67, 42, 21),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: Get.back,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        onChanged: (index) {
                          namaRsvp.value = index;
                        },
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 61, 111))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 255, 255))),
                          hintText: 'Nama',
                        ),
                      ),
                      TextFormField(
                        onChanged: (index) {
                          notelRsvp.value = index;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'No Tel: 0123456789',
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 61, 111))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 255, 255))),
                        ),
                      ),
                      RadioListTile<String>(
                        title: const Text('Tidak Hadir'),
                        value: 'Tidak Hadir',
                        groupValue: selectedOption.value,
                        onChanged: (value) => rsvpValue(value),
                      ),
                      RadioListTile<String>(
                        title: const Text('Seorang'),
                        value: 'Seorang',
                        groupValue: selectedOption.value,
                        onChanged: (value) => rsvpValue(value),
                      ),
                      RadioListTile<String>(
                        title: const Text('Sekeluarga'),
                        value: 'Sekeluarga',
                        groupValue: selectedOption.value,
                        onChanged: (value) => rsvpValue(value),
                      ),
                      RadioListTile<String>(
                        title: const Text('Lain-lain'),
                        value: 'lain2',
                        groupValue: selectedOption.value,
                        onChanged: (value) => rsvpValue(value),
                      ),
                      if (selectedOption.value == 'lain2')
                        TextFormField(
                          // controller: _otherTextController,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 61, 111))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255))),
                            labelText: 'Other Option',
                          ),
                          onChanged: (index) => rsvpOtherValue(index),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // TextButton(
                            //   onPressed: () => Get.back(),
                            //   child: const Text(
                            //     'tutup',
                            //     style: TextStyle(
                            //         color: Color.fromARGB(255, 2, 0, 131)),
                            //   ),
                            // ),
                            ElevatedButton(
                              onPressed: rsvpSave,
                              child: const Text('Hantar'),
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Color.fromARGB(255, 2, 0, 131)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
              ),
              backgroundColor: Color.fromARGB(217, 202, 146, 87),
              titleStyle: TextStyle(color: Colors.white, fontSize: 0),
              middleTextStyle: TextStyle(color: Colors.white),
              radius: 30);
          break;
        case 4:
          Get.defaultDialog(
            title: "",
            titlePadding: EdgeInsets.all(0),
            content: Container(
              width: 1000,
              height: Get.height * 0.6,
              padding: const EdgeInsets.all(7.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      SizedBox(
                          // flex: 1,
                          child: Text(
                        "Ucapan",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: Get.back,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Obx(() => Expanded(
                        child: ListView(
                          children: dataList
                              .map((element) => ListTile(
                                    title: Center(
                                        child: Text(
                                            '"${element.komen.toString()}"')),
                                    subtitle: Center(
                                        child:
                                            Text('${element.nama.toString()}')),
                                  ))
                              .toList(),
                        ),
                      )),
                  Row(children: [
                    Expanded(
                      flex: 1,
                      child: TextField(
                        minLines: 1,
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        onChanged: (index) {
                          ucapanNama.value = index;
                        },
                        decoration: InputDecoration(
                          hintText: 'Nama',
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
                        onChanged: (value) {
                          ucapanKomen.value = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Ucapan',
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: ucapanSave,
                      icon: const Icon(Icons.send),
                    ),
                  ]),
                ],
              ),
            ),
            backgroundColor: Color.fromARGB(217, 239, 239, 239),
            titleStyle:
                TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 0),
            middleTextStyle: TextStyle(color: Colors.white),
            radius: 30,
          );
          break;
      }
    }
  }

  rsvpValue(value) {
    selectedOption.value = value;
    kehadiran.value = value;
    // return print(value);
  }

  rsvpOtherValue(index) {
    kehadiran.value = index;
    // return print(index);
  }

  rsvpSave() async {
    // print(namaRsvp.value);
    // print(notelRsvp.value);
    // print(kehadiran.value);
    if (namaRsvp.value.isEmpty == false ||
        notelRsvp.value.isEmpty == false ||
        kehadiran.value.isEmpty == false) {
      await RsvpApis.addApiData();
      Get.smartManagement;
      SuccessDialog();
    } else {
      ErrorDialog();
    }
  }

  ucapanSave() async {
    // print(ucapanNama.value);
    // print(ucapanKomen.value);
    if (ucapanNama.value.isEmpty == false ||
        ucapanKomen.value.isEmpty == false) {
      SuccessDialog();
      await WishApis.addApiData();
      dataList.clear();
      fetchData();
      Get.smartManagement;
    } else {
      ErrorDialog();
    }
    // Get.back();
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

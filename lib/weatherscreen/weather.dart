import 'dart:convert';

import 'package:cropssafe/consts/constants.dart';
import 'package:cropssafe/weatherscreen/planthealth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../diseases/AppleBlackRot.dart';
import '../diseases/AppleCedarRust.dart';
import '../diseases/AppleScab.dart';
import '../diseases/Healthy.dart';
import '../diseases/PotatoEarlyBlight.dart';
import '../diseases/PotatoLateBlight.dart';
import '../models/apimodel.dart';
import 'feeds_widget.dart';
import 'moisture.dart';

class wether extends StatefulWidget {
  wether({Key? key}) : super(key: key);

  @override
  State<wether> createState() => _wetherState();
}

class _wetherState extends State<wether> {
  ApiDataModel? dataModelApi;
  late Conditions temp = Conditions(), humid, moist;
  String head = "";

  int count = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: kSpiritedGreen,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: StreamBuilder(
            stream: Stream.periodic(Duration(seconds: 5)).asyncMap(
                (i) => _fetchData()), // i is null here (check periodic docs)

            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('We got an Error ${snapshot.error}');
              }
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: Container(
                      child: Theme(
                        data: ThemeData.light(),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 300),
                          child: CupertinoActivityIndicator(
                            animating: true,
                            radius: 20,
                          ),
                        ),
                      ),
                    ),
                  );

                case ConnectionState.none:
                  return Text('oops no data');

                case ConnectionState.done:
                  return Text('We are Done');
                default:
                  return Column(children: [
                    SizedBox(
                      height: 5,
                    ),
                    PlantHealth(
                      temp: temp,
                      humid: humid,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Classified Disease',
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          FeedsWidget(
                            pimage: 'assets/black.jpg',
                            name: 'Apple Black Rot',
                            onpressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AppleBlack()));
                            },
                          ),
                          FeedsWidget(
                            onpressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AppleCedarRust()));
                            },
                            pimage: 'assets/cedar.jpg',
                            name: 'Apple Cedar Rust',
                          ),
                          FeedsWidget(
                            onpressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AppleScab()));
                            },
                            pimage: 'assets/scab.jpg',
                            name: 'Apple Scab',
                          ),
                          FeedsWidget(
                              onpressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Healthy()));
                              },
                              pimage: 'assets/health.png',
                              name: 'Healthy'),
                          FeedsWidget(
                            onpressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PotatoEarlyBlight()));
                            },
                            pimage: 'assets/16.jpg',
                            name: 'Potato Early Blight',
                          ),
                          FeedsWidget(
                            onpressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PotatoLateBlight()));
                            },
                            pimage: 'assets/17.jpg',
                            name: 'Potato Late Blight',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MoistureView(
                      moist: moist,
                    ),
                  ]);
              }
            },
          ),
        ),
      ),
    );
  }

  _fetchData() async {
    final response = await http.get(Uri.parse(
        'https://api.thingspeak.com/channels/1490676/feeds.json?api_key=6CLVROP39ZFUDNV7'));

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
//print('response ${jsonDecode(response.body)}');
      dataModelApi = ApiDataModel.fromJson(json.decode(response.body));
      print(dataModelApi!.feeds![0].field1);
      print("Successfully fetched and parsed Sensor Data");

      //Temperature

      if (double.parse(dataModelApi!.feeds![0].field1!).toInt() >= 18 &&
          double.parse(dataModelApi!.feeds![0].field1!).toInt() <= 24) {
        temp = Conditions();
        temp.icon = 'assets/temperature.png';
        temp.name = 'Temperature';
        temp.value = '${double.parse(dataModelApi!.feeds![0].field1!).toInt()}';
        temp.subText = 'Normal';
        temp.color = '$normalTemp';
        temp.subColor = '$normalText';
      } else if (double.parse(dataModelApi!.feeds![0].field1!).toInt() > 24 &&
          double.parse(dataModelApi!.feeds![0].field1!).toInt() <= 35) {
        temp = Conditions();
        temp.icon = 'assets/temperature.png';
        temp.name = 'Temperature';
        temp.value = '${double.parse(dataModelApi!.feeds![0].field1!).toInt()}';
        temp.subText = 'Moderate';
        temp.color = '$moderateTemp';
        temp.subColor = '$moderateText';
      } else if (double.parse(dataModelApi!.feeds![0].field1!).toInt() > 35) {
        temp = Conditions();
        temp.icon = 'assets/temperature.png';
        temp.name = 'Temperature';
        temp.value = '${double.parse(dataModelApi!.feeds![0].field1!).toInt()}';
        temp.subText = 'Critical';
        temp.color = '$highTemp';
        temp.subColor = '$highText';
      }

      //Humidity

      if (double.parse(dataModelApi!.feeds![0].field2!).toInt() >= 50 &&
          double.parse(dataModelApi!.feeds![0].field2!).toInt() <= 70) {
        humid = Conditions();
        humid.icon = 'assets/humidity.png';
        humid.name = 'Humidity';
        humid.value =
            '${double.parse(dataModelApi!.feeds![0].field2!).toInt()}';
        humid.subText = 'Normal';
        humid.color = '$lightBlueHumidity';
        humid.subColor = '$normalText';
      } else if (double.parse(dataModelApi!.feeds![0].field2!).toInt() < 50) {
        humid = Conditions();
        humid.icon = 'assets/humidity.png';
        humid.name = 'Humidity';
        humid.value =
            '${double.parse(dataModelApi!.feeds![0].field2!).toInt()}';
        humid.subText = 'low';
        humid.color = '$lightBlueHumidity';
        humid.subColor = '$moderateText';
      } else if (double.parse(dataModelApi!.feeds![0].field2!).toInt() > 70) {
        humid = Conditions();
        humid.icon = 'assets/humidity.png';
        humid.name = 'Humidity';
        humid.value =
            '${double.parse(dataModelApi!.feeds![0].field2!).toInt()}';
        humid.subText = 'High';
        humid.color = '$lightBlueHumidity';
        humid.subColor = '$highText';
      }

      //Moisture

      if (double.parse(dataModelApi!.feeds![0].field3!).toInt() >= 70 &&
          double.parse(dataModelApi!.feeds![0].field3!).toInt() <= 100) {
        moist = Conditions();
        moist.icon = 'assets/drip.png';
        moist.name = 'Moisture';
        moist.value = '60';
        moist.subText = 'No Irrigation Required';
        moist.color = '${darkBlueMoisture}';
        moist.subColor = '${normalText}';
        head = moist.subText;
        print(head);
      } else if (double.parse(dataModelApi!.feeds![0].field3!).toInt() >= 30 &&
          double.parse(dataModelApi!.feeds![0].field3!).toInt() < 70) {
        moist = Conditions();
        moist.icon = 'assets/drip.png';
        moist.name = 'Moisture';
        moist.value = '60';
        moist.subText = 'Irrigation to Be Applied';
        moist.color = '${darkBlueMoisture}';
        moist.subColor = '${moderateText}';
        head = moist.subText;
        print(head);
      } else if (double.parse(dataModelApi!.feeds![0].field3!).toInt() < 30) {
        moist = Conditions();
        moist.icon = 'assets/drip.png';
        moist.name = 'Moisture';
        moist.value = '80';
        moist.subText = 'No Irrigation Required';
        moist.color = '${darkBlueMoisture}';
        moist.subColor = '${normalText}';
        head = moist.subText;
        print(head);
        // if (firsttime) {
        //   print("Moisture: " + head);
        //   if (head == "Critically Low Soil Moisture") {
        //     NotificationService().instantNotification(
        //         head, "Please water the plants with more water", "alert");
        //   } else if (head == "Irrigation to Be Applied") {
        //     NotificationService()
        //         .instantNotification(head, "Please water the plants", "alert");
        //   } else if (head == "No Irrigation Required") {
        //     NotificationService()
        //         .instantNotification(head, "Your crop is healthy", "normal");
        //   }
        //   firsttime = false;
        // }
      }
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Sensor Data');
    }
  }
}

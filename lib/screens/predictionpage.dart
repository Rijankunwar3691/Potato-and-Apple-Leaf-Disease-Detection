import 'package:cropssafe/consts/constants.dart';
import 'package:cropssafe/diseases/AppleBlackRot.dart';
import 'package:cropssafe/diseases/AppleCedarRust.dart';
import 'package:cropssafe/inner_screens/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../diseases/AppleScab.dart';
import '../diseases/Healthy.dart';
import '../diseases/PotatoEarlyBlight.dart';
import '../diseases/PotatoLateBlight.dart';

class PredictionPage extends StatefulWidget {
  final String predictionclass;
  final double confidence;

  const PredictionPage({
    required this.predictionclass,
    required this.confidence,
  });

  @override
  State<PredictionPage> createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSpiritedGreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB((13), 0, (13), (20)),
              child: Container(
                decoration: BoxDecoration(
                  color: kMain,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular((10)),
                      bottomRight: Radius.circular((10))),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.fromLTRB((0.092 * 0.2), 90, 0, (0.092 * 0.4)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Predicited Results',
                          style: GoogleFonts.sail(
                              fontSize: 50, color: kDarkGreenColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                      height: 300.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: kSpiritedGreen,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 8.0,
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 5.0)
                          ]),
                      child: Center(
                        child: Text(
                          'Prediction Successful !',
                          style: GoogleFonts.sail(
                              fontSize: 50, color: kDarkGreenColor),
                          textAlign: TextAlign.center,
                        ), //TextWidget(
                        //     text: 'Prediction Successful !',
                        //     color: Colors.black,
                        //     textSize: 20),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width - 24.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: kMain,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2.0,
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2.0)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Results : ' + widget.predictionclass,
                        style: TextStyle(
                          fontFamily: "VT323",
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width - 24.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: kMain,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2.0,
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2.0)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Confidence : ' +
                            widget.confidence.toStringAsFixed(2) +
                            '' +
                            '%',
                        style: TextStyle(
                          fontFamily: "VT323",
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (() {
                resultPage(context, widget.predictionclass);
              }),
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  height: 60.0,
                  width: MediaQuery.of(context).size.width - 24.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: kMain,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2.0,
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2.0)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Details of Disease',
                          style: TextStyle(
                            fontFamily: "VT323",
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  resultPage(BuildContext context, String name) {
    if (name == "Apple___Apple_scab") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AppleScab()),
      );
    } else if (name == "Apple___Black_rot") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AppleBlack()),
      );
    } else if (name == "Apple___ Cedar_apple_rust") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AppleCedarRust()),
      );
    } else if (name == "Potato___Early_blight") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PotatoEarlyBlight()),
      );
    } else if (name == "Potato___Late_blight") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PotatoLateBlight()),
      );
    } else if (name == "Apple___healthy" || name == "Potato___healthy") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Healthy()),
      );
    } else {}
  }
}

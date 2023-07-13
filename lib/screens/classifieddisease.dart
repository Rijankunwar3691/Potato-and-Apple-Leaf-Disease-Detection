import 'package:cropssafe/consts/constants.dart';
import 'package:cropssafe/diseases/AppleBlackRot.dart';
import 'package:cropssafe/diseases/AppleCedarRust.dart';
import 'package:cropssafe/diseases/AppleScab.dart';
import 'package:cropssafe/diseases/Healthy.dart';
import 'package:cropssafe/diseases/PotatoEarlyBlight.dart';
import 'package:cropssafe/diseases/PotatoLateBlight.dart';
import 'package:cropssafe/inner_screens/diseasepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Classifiedisease extends StatefulWidget {
  Classifiedisease({Key? key}) : super(key: key);

  @override
  State<Classifiedisease> createState() => _ClassifiediseaseState();
}

class _ClassifiediseaseState extends State<Classifiedisease> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: kSpiritedGreen,
      ),
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
                        'Classified Disease',
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 234, 226, 202),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular((30)),
                    bottomRight: Radius.circular((30))),
              ),
              height: 500,
              child: SingleChildScrollView(
                child: Column(children: [
                  Diseasepage(
                    pimage: 'assets/black.jpg',
                    name: 'Apple Black Rot',
                    onpressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AppleBlack()));
                    },
                  ),
                  Diseasepage(
                      onpressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AppleCedarRust()));
                      },
                      pimage: 'assets/cedar.jpg',
                      name: 'Apple Cedar Rust'),
                  Diseasepage(
                      onpressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AppleScab()));
                      },
                      pimage: 'assets/scab.jpg',
                      name: 'Apple Scab'),
                  Diseasepage(
                      onpressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Healthy()));
                      },
                      pimage: 'assets/health.png',
                      name: 'Healthy'),
                  Diseasepage(
                      onpressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PotatoEarlyBlight()));
                      },
                      pimage: 'assets/16.jpg',
                      name: 'Potato Early Blight'),
                  Diseasepage(
                      onpressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PotatoLateBlight()));
                      },
                      pimage: 'assets/17.jpg',
                      name: 'Potato Late Blight'),
                ]),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

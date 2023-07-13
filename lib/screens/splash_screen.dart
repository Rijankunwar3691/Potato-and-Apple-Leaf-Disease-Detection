import 'dart:async';

import 'package:cropssafe/consts/constants.dart';
import 'package:cropssafe/screens/landingpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Landing_page())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kSpiritedGreen,
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 150),
              child: Image.asset(
                "images/logo1.png",
                fit: BoxFit.fill,
              ),
            ),
            
            Column(
              children: [
                SizedBox(
                  height: 450,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 70,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Crops Safe',
                      style: GoogleFonts.sail(
                          fontSize: 50, color: kDarkGreenColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 100),
                SpinKitCircle(
                  color: Color.fromARGB(255, 60, 226, 30),
                  size: 50.0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

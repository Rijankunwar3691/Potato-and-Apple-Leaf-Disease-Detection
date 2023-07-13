import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Diseasepage extends StatelessWidget {
  const Diseasepage({Key? key, required this.pimage, required this.name, required this.onpressed}) : super(key: key);
  final String pimage;
  final String name;
  final Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onpressed,
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 97, 202, 152),
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
              image: DecorationImage(
                  image: AssetImage(pimage), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.red,
              border: Border.all(
                  color: Color.fromARGB(255, 47, 89, 48),
                  width: 4.0,
                  style: BorderStyle.solid),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 100, top: 10),
              child: Text(
                name,
                style: GoogleFonts.poppins(
                    fontSize: 30.0, color: Color.fromARGB(255, 182, 247, 212)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

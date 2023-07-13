import 'package:cropssafe/consts/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class GreetingSection extends SliverFixedExtentList {
  GreetingSection(double height, {Key? key})
      : super(
          key: key,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB((0.079*height), 0, (0.079*height), (0.079*height)),
                child: Container(
                  decoration: BoxDecoration(
                    color: kMain,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular((0.079*height)),
                        bottomRight: Radius.circular((0.079*height))),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB((0.092*height), 0, 0, (0.099*height)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Crops Safe',
                      style: GoogleFonts.sail(
                          fontSize: 50, color: kDarkGreenColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                      ],
                    ),
                  ),
                ),
              );
            },
            childCount: 1,
          ),
          itemExtent: height,
        );
}

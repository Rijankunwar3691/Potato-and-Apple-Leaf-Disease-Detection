import 'package:cropssafe/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageSection extends SliverFixedExtentList {
  ImageSection(image, {Key? key})
      : super(
            key: key,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, index) {
                return Center(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        height: 300.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color:kSpiritedGreen,
                          borderRadius: BorderRadius.circular((20)),
                        ),
                        child: Center(
                          child: image == null
                              ? const Text(
                                  'No image selected',
                                  style: TextStyle(fontSize: 20),
                                )
                              : Image.file(
                                  image!,
                                  width: 400,
                                  height: 300,
                                  fit: BoxFit.cover,
                                  
                                ),
                                
                        ),
                      )),
                );
              },
              childCount: 1,
            ),
            itemExtent: 200);
}

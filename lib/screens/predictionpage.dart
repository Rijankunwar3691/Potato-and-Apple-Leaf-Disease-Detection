import 'package:cropssafe/consts/constants.dart';
import 'package:flutter/material.dart';

class PredictionPage extends StatelessWidget {
  final String predictionclass;
  final double confidence;
  const PredictionPage(
      {required this.predictionclass, required this.confidence});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSpiritedGreen,
      body: Text(predictionclass + "  " + confidence.toString()),
    );
  }
}

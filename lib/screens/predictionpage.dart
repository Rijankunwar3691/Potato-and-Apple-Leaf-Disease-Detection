import 'package:flutter/material.dart';

class PredictionPage extends StatelessWidget {
  final String predictionclass;
  final double confidence;
  const PredictionPage(
      {required this.predictionclass, required this.confidence});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(predictionclass + "  " + confidence.toString()),
    );
  }
}

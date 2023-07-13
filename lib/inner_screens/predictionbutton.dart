import 'package:cropssafe/consts/constants.dart';
import 'package:flutter/material.dart';

class PredictionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PredictionButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
        right: 80,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (states) => kMain,
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(15), // Set padding
            ),
          ),
          onPressed: onPressed,
          child: Text('Predict'),
        ),
      ),
    );
  }
}

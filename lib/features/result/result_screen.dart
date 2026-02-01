import 'package:flutter/material.dart';
import '../../core/color_manager.dart';
import '../../core/styles.dart';

class ResultScreen extends StatelessWidget {
  // These are the 3 things this screen needs to display
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultScreen({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldBackground,
      appBar: AppBar(
        title: const Text('BMI CALCULATOR', style: Styles.whitebold),
        //backgroundColor: ColorManager.primary,
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // "Your Result" Title
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // The Main Card
          Expanded(
            flex: 5, // Takes up 5 times more space than the title
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorManager.secondary,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 1. The Result Text (Normal/Overweight)
                  Text(
                    resultText.toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFF24D876), // The Green Color
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // 2. The BMI Number
                  Text(
                    bmiResult,
                    style: const TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  // 3. The Interpretation Message
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Re-Calculate Button
          GestureDetector(
            onTap: () {
              Navigator.pop(context); // Go back to previous screen
            },
            child: Container(
              color: ColorManager.accent,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
              child: const Center(
                child: Text(
                  'RE-CALCULATE',
                  style: Styles.whitebold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi = 0; // Private variable to store the result

  CalculatorBrain({required this.height, required this.weight});

  // 1. Get the BMI Number (e.g., "19.2")
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1); // Returns 1 decimal place
  }

  // 2. Get the Result Label (e.g., "Normal")
  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  // 3. Get the Interpretation (The advice text)
  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
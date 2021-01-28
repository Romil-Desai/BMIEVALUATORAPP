import 'dart:math';

class CalculatorBrain {
  int height;
  int weight;
  double _bmi;

  CalculatorBrain({this.height, this.weight});

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getfeedback() {
    if (_bmi >= 25) {
      return 'You have higher than normal body weight, try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight.Nice Job!!';
    } else {
      return 'Your BMI result is quiet low, you should eat more';
    }
  }
}

import 'dart:math';

class FindResult {
  FindResult(this.height, this.weight);

  final int height;
  final int weight;
  double bmi;
  double gain;
  double finalGain;
  double finalLose;
  int least;

  String findBmi() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String findGain() {
    if (bmi < 18.5) {
      gain = 18.5 * pow(height / 100, 2);
      finalGain = gain - weight;
      return "YOU NEED TO GAIN ATLEAST  " +
          finalGain.toStringAsFixed(1) +
          " Kgs";
    } else if (bmi > 22.9) {
      gain = 22.9 * pow(height / 100, 2);
      finalLose = weight - gain;
      return "YOU NEED TO LOSE ATLEAST  " +
          finalLose.toStringAsFixed(1) +
          " Kgs";
    } else {
      return "GOOD";
    }
  }

  String findMessage() {
    if (bmi >= 30.0) {
      return "OBESE II";
    } else if (bmi >= 25) {
      return "OBESE I";
    } else if (bmi >= 23) {
      return "OVERWEIGHT AT RISK";
    } else if (bmi >= 18.5) {
      return "NORMAL WEIGHT";
    } else {
      return "UNDERWEIGHT";
    }
  }

  String findCaption() {
    if (bmi >= 30.0) {
      return "You are in the OBESE II that means you are very fat, Immediately you must take action to reduce your weight";
    } else if (bmi >= 25) {
      return "OBESE I means that you must take care of your body weight";
    } else if (bmi >= 23) {
      return "You are just above the normal level BMI";
    } else if (bmi >= 18.5) {
      return "Excellent Work, Keep it up";
    } else {
      return "Too thin.. Take some good foods and take care about your heath";
    }
  }
}

import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
  TextEditingController numberOneController = TextEditingController();
  TextEditingController numberTwoController = TextEditingController();
  List<String> listResults = [];
  double result = 0;
  String stringResult = '';

  void onSubmit(String title) {
    if (numberOneController.text.isEmpty || numberTwoController.text.isEmpty) {
      return;
    }
    double numberOne = double.parse(numberOneController.text);
    double numberTwo = double.parse(numberTwoController.text);

    if (title == '/' && numberTwo == 0) {
      stringResult = '';
      notifyListeners();
      return;
    }

    switch (title) {
      case '+':
        result = numberOne + numberTwo;
        break;
      case '-':
        result = numberOne - numberTwo;
        break;
      case '*':
        result = numberOne * numberTwo;
        break;
      case '/':
        result = numberOne / numberTwo;
        break;
      default:
    }

    stringResult =
        '${numberOne.toInt()} $title ${numberTwo.toInt()} = ${result.toInt()}';
    listResults.add(stringResult);
    notifyListeners();

    numberOneController.clear();
    numberTwoController.clear();
  }

  void deleteResult(int index) {
    listResults.removeAt(index);
    notifyListeners();
  }

  void clearAllResults() {
    listResults.clear();
    notifyListeners();
  }
}

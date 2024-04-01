import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';

import '../../reusable_widgets/result_box.dart';
import '../model/db_connect.dart';
import '../model/question_model.dart';

class QuizProvider with ChangeNotifier {
  var db = DBconnect();
  late Future questions;
  int index = 0;
  int score = 0;
  int selectedIndex = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;

  initMethod() {
    questions = getData();
  }

  Future<List<Question>> getData() async {
    return db.fetchQuestions();
  }

  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      showDialog(
          context: navigatorKey.currentContext!,
          barrierDismissible: false,
          builder: (ctx) => ResultBox(
                result: score,
                questionLength: questionLength,
                onPressed: startOver,
              ));
    } else {
      if (isPressed) {
        index++;
        isPressed = false;
        isAlreadySelected = false;
        notifyListeners();
      } else {
        ScaffoldMessenger.of(navigatorKey.currentContext!)
            .showSnackBar(const SnackBar(
          content: Text('Please select any option'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      isPressed = true;
      isAlreadySelected = true;
      notifyListeners();
    }
  }

  void startOver() {
    index = 0;
    score = 0;
    isPressed = false;
    isAlreadySelected = false;
    notifyListeners();
    Navigator.pop(navigatorKey.currentContext!);
  }
}

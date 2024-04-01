import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'question_model.dart';

class DBconnect {
  final url = Uri.parse(
      'https://quiz-app-269d2-default-rtdb.firebaseio.com/questions.json');

  Future<List<Question>> fetchQuestions() async {
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      debugPrint('data = $data');
      List<Question> newQuestions = [];
      data.forEach((key, value) {
        var newQuestion = Question(
          id: key,
          title: value['title'], // title of the question
          options: Map.castFrom(value['option']), // options of the question
        );
        newQuestions.add(newQuestion);
      });
      return newQuestions;
    });
  }
}

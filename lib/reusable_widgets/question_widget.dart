import 'package:flutter/material.dart';
import '../utils/color_utils.dart'; // it contains our colors.

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {Key? key,
        required this.question,
        required this.indexAction,
        required this.totalQuestions})
      : super(key: key);
  // here we need the question title and the total number of questions, and also the index

  final String question;
  final int indexAction;
  final int totalQuestions;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        '${indexAction + 1}. $question',
        style:Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
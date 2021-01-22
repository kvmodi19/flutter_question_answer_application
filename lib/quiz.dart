import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';
import './model/question.dart';

class Quiz extends StatelessWidget {
  final List<Question> questions;
  final Function answerQuestion;
  final int quextionIndex;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.quextionIndex,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuizQuestion(questions[quextionIndex].question),
        ...(questions[quextionIndex].options)
            .map((key) => Answer(key, () => answerQuestion(key)))
            .toList()
      ],
    );
  }
}

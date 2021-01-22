import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
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
        Question(questions[quextionIndex]['question']),
        ...(questions[quextionIndex]['options'] as List<Map<String, Object>>)
            .map((key) =>
                Answer(key['text'], () => answerQuestion(key['score'])))
            .toList()
      ],
    );
  }
}

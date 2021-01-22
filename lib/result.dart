import 'package:flutter/material.dart';

import './model/question.dart';

class Result extends StatelessWidget {
  final List<Question> questions;
  final Function restartQuizHandler;

  Result(this.questions, this.restartQuizHandler);

  int get _total {
    int score = 0;
    questions.forEach((question) {
      if (question.answerIsCorrect) {
        score += 1;
      }
    });
    return score;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Done!!!!',
            style: TextStyle(
              fontSize: 28,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Total Questions ${questions.length}'),
          Text('final score $_total'),
          FlatButton(
            onPressed: restartQuizHandler,
            child: Text('Restart quiz'),
          )
        ],
      ),
    );
  }
}

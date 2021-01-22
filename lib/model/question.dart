import 'package:flutter/cupertino.dart';

class Question {
  String question;
  String correctAnswer;
  String type;
  List<String> incorrectAnswer;
  List<String> options;
  String selectedAnswer;
  bool answerIsCorrect;

  Question({
    @required this.question,
    @required this.correctAnswer,
    @required this.type,
    @required this.incorrectAnswer,
    this.options,
  });

  factory Question.fromJson(dynamic json) {
    return Question(
      question: json['question'],
      correctAnswer: json['correct_answer'],
      type: json['type'],
      incorrectAnswer: List<String>.from(json['incorrect_answers']),
      options: List<String>.from(
          [json['correct_answer'], ...json['incorrect_answers']].toSet()),
    );
  }
}

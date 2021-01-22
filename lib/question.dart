import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';

class QuizQuestion extends StatelessWidget {
  final String questionText;
  final unescape = new HtmlUnescape();

  QuizQuestion(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        unescape.convert(questionText),
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}

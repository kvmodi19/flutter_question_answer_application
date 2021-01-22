import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final _questions = const [
    {
      'question': 'Choose faviourite color',
      'options': [
        {'text': 'Blue', 'score': 20},
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 5},
        {'text': 'Yellow', 'score': 0},
      ]
    },
    {
      'question': 'Choose faviourite animal',
      'options': [
        {'text': 'Tiger', 'score': 20},
        {'text': 'Lion', 'score': 10},
        {'text': 'Horse', 'score': 5},
        {'text': 'Fox', 'score': 0},
      ],
    }
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex++;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question App'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              questions: _questions,
              answerQuestion: _answerQuestion,
              quextionIndex: _questionIndex,
            )
          : Result(_totalScore, _restartQuiz),
    );
  }
}

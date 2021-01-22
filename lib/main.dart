import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './quiz.dart';
import './result.dart';
import './model/question.dart';

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
  String url = 'https://opentdb.com/api.php?amount=10';
  int _questionIndex = 0;
  bool loading = false;

  var _questions = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      loading = true;
    });
    this.fetchQuestions();
  }

  Future<Null> fetchQuestions() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = (jsonDecode(response.body)['results']);
      setState(() {
        _questions = data.map<Question>((question) {
          return Question.fromJson(question);
        }).toList();
        loading = false;
      });
    } else {
      throw Exception('Failed to load Questions');
    }
  }

  void _answerQuestion(String answer) {
    if (_questionIndex < _questions.length) {
      setState(() {
        (_questions[_questionIndex] as Question).selectedAnswer = answer;
        (_questions[_questionIndex] as Question).answerIsCorrect =
            (_questions[_questionIndex] as Question).correctAnswer == answer;

        _questionIndex++;
      });
    }
  }

  void _restartQuiz() {
    this.fetchQuestions();
    setState(() {
      _questionIndex = 0;
      loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question App'),
      ),
      body: Center(
        child: !loading
            ? (_questionIndex < _questions.length
                ? Quiz(
                    questions: _questions,
                    answerQuestion: _answerQuestion,
                    quextionIndex: _questionIndex,
                  )
                : Result(_questions, _restartQuiz))
            : CircularProgressIndicator(),
      ),
    );
  }
}

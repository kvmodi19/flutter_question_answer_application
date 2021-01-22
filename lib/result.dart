import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int total;
  final Function restartQuizHandler;

  Result(this.total, this.restartQuizHandler);

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
          Text('final score $total'),
          FlatButton(
            onPressed: restartQuizHandler,
            child: Text('Restart quiz'),
          )
        ],
      ),
    );
  }
}

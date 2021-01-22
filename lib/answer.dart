import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape_small.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;
  final unescape = new HtmlUnescape();

  Answer(this.answerText, this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(unescape.convert(answerText)),
        onPressed: selectHandler,
      ),
    );
  }
}

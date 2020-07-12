import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;
  Result(this.totalScore, this.resetHandler);

  String get resultPhrase {
    var resultText;
    if (totalScore < 1) {
      resultText = 'You need to practice more!!';
    } else if (totalScore < 2) {
      resultText = 'Almost there!!';
    } else {
      resultText = 'You did it!! Perfection :)';
    }
    resultText += ' Your score is $totalScore';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
              textColor: Colors.blue,
              child: Text('Restart Quiz'),
              onPressed: resetHandler)
        ],
      ),
    );
  }
}

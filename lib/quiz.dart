import 'package:flutter/material.dart';
import './question.dart' as question;
import './answer.dart' as answer;
import './utils/constants.dart';

class Quiz extends StatelessWidget {
  final int _questionIndex;
  final Function _answerQuestion;
  Quiz(this._questionIndex, this._answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        question.Question(questions[_questionIndex][QUESTION]),
        ...(questions[_questionIndex][ANSWERS] as List<Map<String, dynamic>>)
            .map((ansMap) {
          return answer.Answer(
              () => _answerQuestion(ansMap['score']), ansMap['text']);
        }).toList()
      ],
    );
  }
}

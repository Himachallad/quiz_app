import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart' as result;
import 'quiz.dart' as quiz;
import './utils/constants.dart' as constants;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;
  void _answerQuestion(int score) {
    this.setState(() {
      _questionIndex++;
      _totalScore += score;
    });
  }

  void _resetQuiz() {
    this.setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(100, 255, 120, 1),
            title: Text(constants.APP_NAME),
          ),
          body: (_questionIndex < constants.questions.length)
              ? quiz.Quiz(_questionIndex, _answerQuestion)
              : result.Result(_totalScore, _resetQuiz)),
    );
  }
}

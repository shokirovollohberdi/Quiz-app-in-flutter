import 'package:flutter/material.dart';
import 'package:hello_dart/answer.dart';
import 'package:hello_dart/question.dart';
import 'package:hello_dart/quiz.dart';
import 'package:hello_dart/result.dart';

/*void main(){
  runApp(MyApp());
}*/

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What's your favorite game?",
      "answer": [
        {'text': 'PUBG Mobile', 'score': 40},
        {'text': 'Free Fire', 'score': 30},
        {'text': 'Counter Strike', 'score': 20},
        {'text': 'Call of duty', 'score': 10}
      ]
    },
    {
      "questionText": "What's your favorite color?",
      "answer": [
        {'text': 'White', 'score': 40},
        {'text': 'Black', 'score': 30},
        {'text': 'Pink', 'score': 20},
        {'text': 'Yellow', 'score': 10}
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      "answer": [
        {'text': 'Cat', 'score': 40},
        {'text': 'Lion', 'score': 30},
        {'text': 'Dog', 'score': 20},
        {'text': 'Cow', 'score': 10}
      ]
    },
    {
      "questionText": "Who's your favorite singer?",
      "answer": [
        {'text': 'Jony', 'score': 40},
        {'text': 'Gafur', 'score': 30},
        {'text': 'Egor Kreed', 'score': 20},
        {'text': 'Xxxtentacion', 'score': 10}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
      if (_questionIndex < _questions.length) {
        print("We have more questions!");
      } else {
        print("No more questions");
      }
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    // _questions = []; // agar questions list const bolsa ishlamedi chunki const ni ozgartirish mumkin emas!

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My Firsl App')),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex)
            : Result(_totalScore, _restartQuiz),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/questions_screen.dart';
import 'package:flutter_quiz_app/results_screen.dart';
import 'package:flutter_quiz_app/start_screen.dart';

enum Screen { start, questions, results }

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  var activeScreen = Screen.start;

  void switchScreen() {
    setState(() {
      activeScreen = Screen.questions;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() => activeScreen = Screen.results);
    }
  }

  void restartQuiz() {
    selectedAnswers.clear();
    setState(() => activeScreen = Screen.start);
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = StartScreen(switchScreen);
    if (activeScreen == Screen.questions) {
      screen = QuestionsScreen(onSelect: chooseAnswer);
    } else if (activeScreen == Screen.results) {
      screen = ResultsScreen(
        answers: selectedAnswers,
        restartQuiz: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ],
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}

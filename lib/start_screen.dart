import 'package:flutter/material.dart';

void buttonHandler() {}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(top: 80, bottom: 30),
            child: const Text(
              'Learn Flutter the fun way!',
              style: TextStyle(
                color: Color.fromARGB(255, 237, 223, 252),
                fontSize: 24,
              ),
            ),
          ),
          OutlinedButton(
            onPressed: buttonHandler,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            child: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/answer_button.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelect});

  final void Function(String answer) onSelect;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var index = 0;

  void answerQuestion(String answer) {
    widget.onSelect(answer);
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[index];
    return Container(
      margin: const EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...currentQuestion.getShuffled().map(
                        (answer) => AnswerButton(
                          label: answer,
                          onClick: () => answerQuestion(answer),
                        ),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

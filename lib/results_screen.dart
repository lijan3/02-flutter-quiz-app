import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.answers});

  final List<String> answers;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < answers.length; i++) {
      summary.add(
        {
          'index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': answers[i],
        },
      );
    }
    return summary;
  }

  void restartQuiz() {}

  @override
  Widget build(BuildContext context) {
    final summary = getSummary();
    final correct = summary.where(
        (question) => question['user_answer'] == question['correct_answer']);

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered ${correct.length} out of ${questions.length} questions correctly!',
              style: GoogleFonts.lato(
                fontSize: 18,
                color: const Color.fromARGB(255, 201, 153, 251),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 30,
                ),
                child: QuestionsSummary(summary: summary)),
            TextButton.icon(
              onPressed: restartQuiz,
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 201, 153, 251),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

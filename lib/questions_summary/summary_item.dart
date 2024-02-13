import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.data});

  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            index: (data['index'] as int),
            isCorrect: (data['user_answer'].toString() ==
                data['correct_answer'].toString()),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['question'].toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: Text(
                    data['user_answer'].toString(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 165, 113, 221),
                      fontSize: 12,
                    ),
                  ),
                ),
                Text(
                  data['correct_answer'].toString(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 113, 179, 221),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

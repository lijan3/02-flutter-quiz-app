import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summary});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary
              .map(
                (data) => Row(
                  children: [
                    Text(((data['index'] as int) + 1).toString()),
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
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

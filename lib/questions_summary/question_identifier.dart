import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {super.key, required this.index, required this.isCorrect});

  final int index;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isCorrect
              ? const Color.fromARGB(255, 150, 198, 241)
              : const Color.fromARGB(255, 249, 133, 241),
          borderRadius: BorderRadius.circular(100)),
      width: 30,
      height: 30,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 24),
      child: Text(
        (index + 1).toString(),
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

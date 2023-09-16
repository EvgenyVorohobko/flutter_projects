import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer, required this.chooseAnswer});

  final String answer;
  final void Function() chooseAnswer;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: chooseAnswer,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 95, 0, 111),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 10
        ),
      ),
      child: Text(answer),
    );
  }
}
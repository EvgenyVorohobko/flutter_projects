import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:questions_quiz/answer_button.dart';
import 'package:questions_quiz/questions_for_quiz.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.chooseAnswer});

  final void Function(String answer) chooseAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {

  final List<QuizQuestion> quizQuestions = questions;
  var questionIndex = 0;

  void chooseAnswer(String selectAnswer) {
    widget.chooseAnswer(selectAnswer);
    setState(() {
      if (questionIndex < quizQuestions.length - 1) {
        questionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quizQuestions[questionIndex].question,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 204, 162, 243),
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...quizQuestions[questionIndex].getShuffleAnswers().map((answer) {
              return AnswerButton(
                answer: answer,
                chooseAnswer: () {
                  chooseAnswer(answer);
                }
              );
            }),
          ],
        ),
      ),
    );
  }
}
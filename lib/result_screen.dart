import 'package:flutter/material.dart';
import 'package:questions_quiz/question_summary.dart';
import 'package:questions_quiz/questions_for_quiz.dart';

class ResultQuiz extends StatelessWidget {
  const ResultQuiz({super.key, required this.resultAnswers, required this.onRestartQuiz});

  final List<String> resultAnswers;
  final void Function() onRestartQuiz;

  List<Map<String, Object>> getResultData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < resultAnswers.length; i++) {
      summary.add({
        'index' : i,
        'question' : questions[i].question,
        'answer' : questions[i].answers[0],
        'user_answer': resultAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getResultData();
    final correctAnswers = summaryData.where((data) {
      return data['user_answer'] == data['answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswers out of ${questions.length} questions correctly!',
              style: const TextStyle(
                color: Color.fromARGB(255, 220, 194, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
            QuestionSummary(summaryData: summaryData),
            const SizedBox(height: 30,),
            TextButton(
              onPressed: onRestartQuiz,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.repeat_sharp,
                    size: 25.0,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'Restart Quiz!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}


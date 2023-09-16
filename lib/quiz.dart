import 'package:flutter/material.dart';
import 'package:questions_quiz/greeting_page.dart';
import 'package:questions_quiz/question_page.dart';
import 'package:questions_quiz/questions_for_quiz.dart';
import 'package:questions_quiz/result_screen.dart';

const List<Color> colors = [
  Color.fromARGB(255, 109, 1, 172),
  Color.fromARGB(255, 81, 0, 156),
];
const Alignment alignmentStart = Alignment.bottomRight;
const Alignment alignmentEnd = Alignment.topLeft;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  List<String> selectedAnswers = [];

  /*Widget? activeScreen;

  @override
  void initState() {
      activeScreen = GreetingPage(switchScreen);
      super.initState();
  }

  void switchScreen() {
      setState(() {
          activeScreen = const QuestionScreen();
      });
  }

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          home: Scaffold(
              body: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: colors,
                          begin: alignmentStart,
                          end: alignmentEnd
                      ),
                  ),
                  child: activeScreen,
              ),
          )
      );
  }*/

  var activeScreen = 'start';

  void switchScreen() {
    setState(() {
      activeScreen = 'quiz';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result';
      });
    }
  }

  void getRestartQuiz() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'start';
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget screenWidget = GreetingPage(switchScreen);
    if (activeScreen == 'start') {
      screenWidget = GreetingPage(switchScreen);
    } else if (activeScreen == 'quiz') {
      screenWidget = QuestionScreen(chooseAnswer: chooseAnswer);
    } else if (activeScreen == 'result') {
      screenWidget = ResultQuiz(resultAnswers: selectedAnswers, onRestartQuiz: getRestartQuiz,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: alignmentStart,
              end: alignmentEnd
            ),
          ),
          child: screenWidget,
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';

const String imageLogo = 'assets/images/quiz-logo.png';
const String greetingText = 'Learn Flutter the fun way!';
const String buttonName = 'Start quiz!';
const Color colorForText = Color.fromRGBO(252, 250, 250, 1);
const Color colorForBackground = Color.fromARGB(255, 98, 25, 188);

class GreetingPage extends StatelessWidget {
  const GreetingPage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imageLogo,
            width: 300,
            color: const Color.fromARGB(100, 255, 255, 255),
          ),
          // Opacity(
          //     opacity: 0.4,
          //     child: Image.asset(
          //         imageLogo,
          //         width: 300,
          //     ),
          // ),
          const SizedBox(
            height: 100,
          ),
          const Text(
            greetingText,
            style: TextStyle(
              color:  colorForText,
              fontSize:  25,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(
              Icons.arrow_forward_rounded,
              color: colorForText,
              size: 24.0
            ),
            label: const Text(
              buttonName,
              style: TextStyle(
                  color: colorForText,
                  fontSize:  20,
              ),
            ),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(colorForBackground),
            ),
          ),
        ],
      ),
    );
  }
}
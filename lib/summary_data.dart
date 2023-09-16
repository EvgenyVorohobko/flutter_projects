import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.data});

  final Map<String, Object> data;
  bool get isCorrectAnswer => data['user_answer'] as String != data['answer'] as String;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: isCorrectAnswer ? const Color.fromARGB(255, 133, 49, 43) : Colors.green,
          child: Text(
            ((data['index'] as int) + 1).toString(),
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(width: 20,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['question'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 220, 194, 255),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                data['user_answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 254, 91, 80),
                  fontSize: 16,
                ),
              ),
              Text(
                data['answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 76, 255, 82),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30,),
            ],
          ),
        )
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'dart:math';

final randomized = Random();

class ImageRoller extends StatefulWidget {
    const ImageRoller({super.key});

    @override
    State<ImageRoller> createState() {
        return _ImageRollerState();
    }
}

class _ImageRollerState extends State<ImageRoller> {
    var activeNumberImage = 1;

    void handleRollImage() {
        setState(() {
            activeNumberImage = randomized.nextInt(3) + 1;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                Image.asset(
                    'assets/gifs/IMG_$activeNumberImage.GIF',
                    width: 400,
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: handleRollImage,
                    style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                        padding: const EdgeInsets.all(10),
                        textStyle: const TextStyle(fontSize: 20)
                    ),
                    child: const Text('Roll Image 1')
                ),
                const SizedBox(height: 10,),
                OutlinedButton(
                    onPressed: handleRollImage,
                    style: OutlinedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 239, 205, 104),
                        padding: const EdgeInsets.all(10),
                        textStyle: const TextStyle(fontSize: 20)
                    ),
                    child:  const Text('Roll Image 2')
                ),
                const SizedBox(height: 10,),
                TextButton(
                    onPressed: handleRollImage ,
                    style: TextButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 255, 255, 255),
                        padding: const EdgeInsets.all(10),
                        textStyle: const TextStyle(fontSize: 20)
                    ),
                    child: const Text('Roll Image 3')
                ),
            ],
        );
    }
}
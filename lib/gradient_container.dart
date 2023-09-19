import 'package:flutter/material.dart';
import 'package:app_project/roll_image.dart';

class GradientContainer extends StatelessWidget {
    const GradientContainer(this.colors, this.startAlignment, this.endAlignment, {super.key});

    final List<Color> colors;
    final AlignmentGeometry startAlignment;
    final AlignmentGeometry endAlignment;

    @override
    Widget build(BuildContext context) {
        return Container(
            decoration:  BoxDecoration(
                gradient: LinearGradient(
                    colors: colors,
                    begin: startAlignment,
                    end: endAlignment
                ),
            ),
            child: const Center(
                child: ImageRoller(),
            ),
        );
    }
}
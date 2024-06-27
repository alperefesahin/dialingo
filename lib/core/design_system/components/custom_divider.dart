import 'package:dialingo/core/design_system/colors/colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.numberOfDivisions = 5});

  final int numberOfDivisions;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        numberOfDivisions,
        (index) {
          return Row(
            children: [
              const Text('o', style: TextStyle(fontSize: 12, color: halfOpacityWhite)),
              if (index < numberOfDivisions - 1) // To avoid trailing space after the last 'o'
                const SizedBox(width: 4),
            ],
          );
        },
      ),
    );
  }
}

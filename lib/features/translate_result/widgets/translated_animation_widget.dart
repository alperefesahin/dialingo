import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TranslatedAnimationWidget extends StatelessWidget {
  const TranslatedAnimationWidget({super.key, required this.controllerForTranslatedWidgetAnimation});

  final AnimationController controllerForTranslatedWidgetAnimation;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Center(
      child: Lottie.asset(
        'assets/lottie/translated.json',
        width: size.width,
        height: size.height / 2.85,
        repeat: false,
        frameRate: FrameRate.max,
        fit: BoxFit.fill,
        controller: controllerForTranslatedWidgetAnimation,
        onLoaded: (composition) {
          controllerForTranslatedWidgetAnimation
            ..duration = composition.duration
            ..forward();
        },
      ),
    );
  }
}

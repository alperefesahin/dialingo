import 'package:dialingo/core/design_system/colors/colors.dart';
import 'package:flutter/material.dart';

class TranslatedTextWidget extends StatelessWidget {
  const TranslatedTextWidget({
    super.key,
    required this.scrollController,
    required this.translatedText,
    required this.showTopGradient,
    required this.showBottomGradient,
  });

  final ScrollController scrollController;
  final String translatedText;
  final bool showTopGradient;
  final bool showBottomGradient;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      height: size.height / 4,
      margin: const EdgeInsets.all(24),
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Text(
              translatedText,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w400, color: Colors.white),
            ),
          ),
          if (showTopGradient)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [black, black.withOpacity(0.5), transparent],
                    stops: const [0, 0.25, 1],
                  ),
                ),
              ),
            ),
          if (showBottomGradient)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [transparent, black.withOpacity(0.5), black],
                    stops: const [0.25, 1, 0],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

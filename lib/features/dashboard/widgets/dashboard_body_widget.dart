import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dialingo/core/design_system/colors/colors.dart';
import 'package:dialingo/core/design_system/components/dialingo_text.dart';
import 'package:dialingo/core/design_system/components/custom_divider.dart';
import 'package:dialingo/features/dashboard/widgets/dashboard_animated_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class DashboardBodyWidget extends StatelessWidget {
  const DashboardBodyWidget({
    super.key,
    required this.controllerForMic,
    required this.onLoaded,
    required this.onTapMic,
  });

  final AnimationController controllerForMic;
  final Function(LottieComposition) onLoaded;
  final Function() onTapMic;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          'assets/svg/people.svg',
          width: size.width,
          height: size.height / 4,
        ),
        Column(
          children: [
            const CustomDivider(),
            const SizedBox(height: 20),
            Container(
              width: size.width,
              height: size.height / 5,
              padding: const EdgeInsets.all(12),
              child: Center(
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: dashboardAnimatedTexts,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const CustomDivider(),
          ],
        ),
        Column(
          children: [
            const DialingoText(
              text: 'Tap to speak',
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: white,
            ),
            const SizedBox(height: 4),
            InkWell(
              splashColor: transparent,
              highlightColor: transparent,
              onTap: onTapMic,
              child: Center(
                child: Lottie.asset(
                  'assets/lottie/mic.json',
                  width: size.width / 3,
                  height: size.height / 6,
                  repeat: true,
                  frameRate: FrameRate.max,
                  controller: controllerForMic,
                  onLoaded: onLoaded,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:dialingo/core/design_system/colors/colors.dart';
import 'package:dialingo/core/design_system/components/dialingo_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lucide_icons/lucide_icons.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({
    super.key,
    required this.onTab,
    required this.onPressedGetStarted,
    required this.index,
    required this.activePage,
  });

  final VoidCallback onTab;
  final VoidCallback onPressedGetStarted;
  final int index;
  final int activePage;

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> with TickerProviderStateMixin {
  late final AnimationController _controllerForFirstOnboardingAnimation;
  late final AnimationController _controllerForSecondOnboardingAnimation;
  late final AnimationController _controllerForThirdOnboardingAnimation;

  @override
  void initState() {
    super.initState();
    _controllerForFirstOnboardingAnimation = AnimationController(vsync: this);
    _controllerForSecondOnboardingAnimation = AnimationController(vsync: this);
    _controllerForThirdOnboardingAnimation = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controllerForFirstOnboardingAnimation.dispose();
    _controllerForSecondOnboardingAnimation.dispose();
    _controllerForThirdOnboardingAnimation.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final List<AnimationController> controllerForOnboardingAnimations = [
      _controllerForFirstOnboardingAnimation,
      _controllerForSecondOnboardingAnimation,
      _controllerForThirdOnboardingAnimation,
    ];

    final title = _pages[widget.index]['title'];
    final description = _pages[widget.index]['description'];
    final animation = _pages[widget.index]['animation'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Lottie.asset(
            animation,
            width: size.width / 1.5,
            repeat: true,
            frameRate: FrameRate.max,
            controller: controllerForOnboardingAnimations[widget.index],
            onLoaded: (composition) {
              controllerForOnboardingAnimations[widget.index]
                ..duration = composition.duration
                ..forward();

              controllerForOnboardingAnimations[widget.index].repeat();
            },
          ),
        ),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.1,
              margin: const EdgeInsets.only(top: 24),
              decoration: BoxDecoration(
                color: black,
                borderRadius: BorderRadius.only(
                  topLeft: widget.index == 0 ? const Radius.circular(100) : const Radius.circular(0),
                  topRight: widget.index == 2 ? const Radius.circular(100) : const Radius.circular(0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 52, bottom: 16),
                      child: DialingoText(
                        text: title,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: white,
                      ),
                    ),
                    DialingoText(
                      text: description,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: white.withOpacity(0.95),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              right: 16,
              left: widget.index == 2 ? 16 : null,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: widget.index != 2
                    ? GestureDetector(
                        onTap: widget.onTab,
                        child: const Icon(LucideIcons.arrowRightCircle, color: white, size: 52),
                      )
                    : SizedBox(
                        height: 48,
                        width: size.width / 2,
                        child: TextButton(
                          onPressed: widget.onPressedGetStarted,
                          style: TextButton.styleFrom(
                            backgroundColor: blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const DialingoText(
                            text: 'Get Started',
                            fontSize: 16,
                            color: white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

final List<Map<String, dynamic>> _pages = [
  {
    'title': 'Translation for Everyone',
    'animation': 'assets/lottie/onboarding1.json',
    'description':
        'Discover seamless communication across languages with our intuitive translation app. Explore translations with country flags, making it effortless to understand and be understood anywhere you go.',
  },
  {
    'title': 'Voice Chat Translation',
    'animation': 'assets/lottie/onboarding2.json',
    'description':
        'Explore instant communication through voice chat translation. Speak naturally and let our app convert your words into another language in real-time, breaking down language barriers effortlessly.',
  },
  {
    'title': 'Powered by AI',
    'animation': 'assets/lottie/onboarding3.json',
    'description':
        'Unlock the future of translation with our AI-powered app. Our technology ensures accurate and efficient translations, providing fast and reliable results for all your communication needs.',
  },
];

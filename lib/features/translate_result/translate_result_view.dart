import 'package:dialingo/core/constants/enums/router_enums.dart';
import 'package:dialingo/core/design_system/colors/colors.dart';
import 'package:dialingo/core/design_system/components/bare_bones_scaffold.dart';
import 'package:dialingo/core/design_system/components/dialingo_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TranslateResultView extends StatefulWidget {
  const TranslateResultView({super.key});

  @override
  State<TranslateResultView> createState() => _TranslateResultViewState();
}

class _TranslateResultViewState extends State<TranslateResultView> with TickerProviderStateMixin {
  late final AnimationController _controllerForMicWidgetAnimation;

  @override
  void initState() {
    super.initState();
    _controllerForMicWidgetAnimation = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controllerForMicWidgetAnimation.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return DialingoScaffold(
      backgroundColor: black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height / 2,
                padding: const EdgeInsets.all(28),
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const SingleChildScrollView(
                  child: DialingoText(
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: black,
                    isTextAlignCenter: false,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: InkWell(
                  splashColor: transparent,
                  highlightColor: transparent,
                  onTap: () {},
                  child: const Row(
                    children: [
                      Icon(LucideIcons.headphones, size: 24, color: white),
                      SizedBox(width: 8),
                      DialingoText(
                        text: 'Listen',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const DialingoText(
                text: 'Tap to reply',
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: white,
              ),
              const SizedBox(height: 4),
              InkWell(
                splashColor: transparent,
                highlightColor: transparent,
                onTap: () {
                  context.goNamed(RouterEnums.speakingScreen.routeName);
                },
                child: Center(
                  child: Lottie.asset(
                    'assets/lottie/mic.json',
                    width: size.width / 3,
                    height: size.height / 6,
                    repeat: true,
                    frameRate: FrameRate.max,
                    controller: _controllerForMicWidgetAnimation,
                    onLoaded: (composition) {
                      _controllerForMicWidgetAnimation
                        ..duration = composition.duration
                        ..forward();

                      _controllerForMicWidgetAnimation.repeat();
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

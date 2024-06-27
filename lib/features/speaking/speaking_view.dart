import 'package:dialingo/core/constants/enums/router_enums.dart';
import 'package:dialingo/core/design_system/colors/colors.dart';
import 'package:dialingo/core/design_system/components/bare_bones_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dialingo/core/design_system/components/custom_divider.dart';
import 'package:google_fonts/google_fonts.dart';

class SpeakingView extends StatefulWidget {
  const SpeakingView({super.key});

  @override
  State<SpeakingView> createState() => _SpeakingViewState();
}

class _SpeakingViewState extends State<SpeakingView> with TickerProviderStateMixin {
  late final AnimationController _controllerForListen;
  late final AnimationController _controllerForSpeak;
  bool _isSendButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    _controllerForListen = AnimationController(vsync: this);
    _controllerForSpeak = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controllerForListen.dispose();
    _controllerForSpeak.dispose();

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Lottie.asset(
                'assets/lottie/listen.json',
                width: size.width,
                height: size.height / 2.2,
                repeat: true,
                frameRate: FrameRate.max,
                controller: _controllerForListen,
                onLoaded: (composition) {
                  _controllerForListen
                    ..duration = composition.duration
                    ..forward();

                  _controllerForListen.repeat();
                },
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: 75,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Center(
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      ScaleAnimatedText(
                        _isSendButtonEnabled ? 'Translating' : 'Listening',
                        textStyle: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
                        textAlign: TextAlign.center,
                        duration: const Duration(seconds: 3),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const CustomDivider(numberOfDivisions: 9),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 12),
                child: InkWell(
                  splashColor: transparent,
                  highlightColor: transparent,
                  onTap: () {
                    setState(() {
                      _isSendButtonEnabled = false;
                    });

                    context.goNamed(RouterEnums.dashboardScreen.routeName);
                  },
                  child: const CircleAvatar(
                    radius: 25,
                    backgroundColor: white,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: black,
                      child: Center(
                        child: Icon(
                          LucideIcons.trash2,
                          size: 20,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Lottie.asset(
                  'assets/lottie/speak.json',
                  width: size.width / 2,
                  height: size.height / 6,
                  repeat: true,
                  frameRate: FrameRate.max,
                  controller: _controllerForSpeak,
                  onLoaded: (composition) {
                    _controllerForSpeak
                      ..duration = composition.duration
                      ..forward();

                    _controllerForSpeak.repeat();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, right: 12),
                child: InkWell(
                  splashColor: transparent,
                  highlightColor: transparent,
                  onTap: () async {
                    setState(() {
                      _isSendButtonEnabled = true;
                    });

                    _controllerForSpeak.reset();

                    Future.delayed(const Duration(seconds: 5)).then((value) {
                      context.goNamed(RouterEnums.translateResultScreen.routeName);
                    });
                  },
                  child: const CircleAvatar(
                    radius: 25,
                    backgroundColor: white,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: black,
                      child: Center(
                        child: Icon(
                          LucideIcons.arrowUp,
                          size: 24,
                          color: white,
                        ),
                      ),
                    ),
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

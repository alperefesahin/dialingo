import 'package:dialingo/core/constants/enums/router_enums.dart';
import 'package:dialingo/core/design_system/colors/colors.dart';
import 'package:dialingo/core/design_system/components/bare_bones_scaffold.dart';
import 'package:dialingo/core/design_system/components/dialingo_text.dart';
import 'package:dialingo/features/translate_result/widgets/translated_animation_widget.dart';
import 'package:dialingo/features/translate_result/widgets/translated_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class TranslateResultView extends StatefulWidget {
  const TranslateResultView({super.key, required this.translatedText});

  final String translatedText;

  @override
  State<TranslateResultView> createState() => _TranslateResultViewState();
}

class _TranslateResultViewState extends State<TranslateResultView> with TickerProviderStateMixin {
  late final AnimationController _controllerForMicWidgetAnimation;
  late final AnimationController _controllerForTranslatedWidgetAnimation;

  final ScrollController _scrollController = ScrollController();

  bool _showTopGradient = false;
  bool _showBottomGradient = true;

  @override
  void initState() {
    super.initState();
    _controllerForMicWidgetAnimation = AnimationController(vsync: this);
    _controllerForTranslatedWidgetAnimation = AnimationController(vsync: this);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _controllerForMicWidgetAnimation.dispose();
    _controllerForTranslatedWidgetAnimation.dispose();
    _scrollController.dispose();

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
              TranslatedAnimationWidget(
                  controllerForTranslatedWidgetAnimation: _controllerForTranslatedWidgetAnimation),
              TranslatedTextWidget(
                translatedText: widget.translatedText,
                scrollController: _scrollController,
                showTopGradient: _showTopGradient,
                showBottomGradient: _showBottomGradient,
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

  void _onScroll() {
    if (_scrollController.position.pixels > 1 && !_showTopGradient) {
      setState(() {
        _showTopGradient = true;
      });
    } else if (_scrollController.position.pixels <= 1 && _showTopGradient) {
      setState(() {
        _showTopGradient = false;
      });
    }

    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 1 && _showBottomGradient) {
      setState(() {
        _showBottomGradient = false;
      });
    } else if (_scrollController.position.pixels < _scrollController.position.maxScrollExtent - 1 &&
        !_showBottomGradient) {
      setState(() {
        _showBottomGradient = true;
      });
    }
  }
}

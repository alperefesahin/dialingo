import 'package:dialingo/core/design_system/components/bare_bones_scaffold.dart';
import 'package:dialingo/features/onboarding/widgets/app_scroll_behaviour.dart';
import 'package:dialingo/features/onboarding/widgets/onboarding_widget.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();

  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    return DialingoScaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: _pageController,
              itemCount: 3,
              // length of the pages
              physics: const ClampingScrollPhysics(),
              scrollBehavior: AppScrollBehavior(),
              onPageChanged: (int page) {
                setState(() {
                  _activePage = page;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return OnboardingWidget(
                  index: index,
                  activePage: _activePage,
                  onTab: onNextPage,
                );
              }),
        ],
      ),
    );
  }

  void onNextPage() {
    if (_activePage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
    }
  }
}

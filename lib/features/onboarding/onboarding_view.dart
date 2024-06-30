import 'package:dialingo/core/constants/enums/hive_box_name_enums.dart';
import 'package:dialingo/core/constants/enums/router_enums.dart';
import 'package:dialingo/core/design_system/components/bare_bones_scaffold.dart';
import 'package:dialingo/core/di/dependency_injector.dart';
import 'package:dialingo/data/local/local_database.dart';
import 'package:dialingo/data/local/onboarding/onboarding_hive_model.dart';
import 'package:dialingo/features/onboarding/widgets/app_scroll_behaviour.dart';
import 'package:dialingo/features/onboarding/widgets/onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  final LocalDatabase localdb = getIt<LocalDatabase>();
  final boxName = HiveBoxName.onboarding.boxName;

  int _activePage = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await checkIfOnboardingCompleted();
    });
  }

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
                  onPressedGetStarted: onPressGetStarted,
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

  void onPressGetStarted() {
    localdb.openHiveBox<OnboardingHiveData>(HiveBoxName.onboarding.boxName);

    final box = localdb.getHiveBox<OnboardingHiveData>(boxName);

    final onboardingData = OnboardingHiveData(isOnboardingCompleted: true);

    box.put(HiveBoxName.onboarding.boxName, onboardingData);

    context.goNamed(RouterEnums.dashboardScreen.routeName);
  }

  Future<void> checkIfOnboardingCompleted() async {
    await localdb.openHiveBox<OnboardingHiveData>(HiveBoxName.onboarding.boxName);

    final box = localdb.getHiveBox<OnboardingHiveData>(boxName);

    final onboardingData = box.get(HiveBoxName.onboarding.boxName);
    final isOnboardingCompleted = onboardingData?.isOnboardingCompleted ?? false;

    if (isOnboardingCompleted && mounted) {
      context.goNamed(RouterEnums.dashboardScreen.routeName);
    }
  }
}

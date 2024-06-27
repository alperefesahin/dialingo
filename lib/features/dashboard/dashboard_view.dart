import 'package:dialingo/core/constants/enums/router_enums.dart';
import 'package:dialingo/core/design_system/colors/colors.dart';
import 'package:dialingo/core/design_system/components/bare_bones_scaffold.dart';
import 'package:dialingo/features/dashboard/widgets/dashboard_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> with TickerProviderStateMixin {
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
    return DialingoScaffold(
      backgroundColor: black,
      body: DashboardBodyWidget(
        controllerForMic: _controllerForMicWidgetAnimation,
        onLoaded: (composition) {
          _controllerForMicWidgetAnimation
            ..duration = composition.duration
            ..forward();

          _controllerForMicWidgetAnimation.repeat();
        },
        onTapMic: () {
          context.goNamed(RouterEnums.speakingScreen.routeName);
        },
      ),
    );
  }
}

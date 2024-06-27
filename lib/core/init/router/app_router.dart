import 'package:dialingo/core/constants/enums/router_enums.dart';
import 'package:dialingo/core/init/router/custom_page_builder_widget.dart';
import 'package:dialingo/features/dashboard/dashboard_view.dart';
import 'package:dialingo/features/speaking/speaking_view.dart';
import 'package:dialingo/features/translate_result/translate_result_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

class AppRouter {
  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouterEnums.translateResultScreen.routeName,
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: RouterEnums.dashboardScreen.routeName,
        name: RouterEnums.dashboardScreen.routeName,
        pageBuilder: (context, state) => customPageBuilderWidget(
          context,
          state,
          const DashboardView(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: RouterEnums.speakingScreen.routeName,
        name: RouterEnums.speakingScreen.routeName,
        pageBuilder: (context, state) => customPageBuilderWidget(
          context,
          state,
          const SpeakingView(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: RouterEnums.translateResultScreen.routeName,
        name: RouterEnums.translateResultScreen.routeName,
        pageBuilder: (context, state) => customPageBuilderWidget(
          context,
          state,
          const TranslateResultView(),
        ),
      ),
    ],
  );
}
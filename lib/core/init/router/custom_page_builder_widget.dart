import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

typedef CustomPageBuilderWidget = CustomTransitionPage<void> Function(
    BuildContext context,
    GoRouterState state,
    Widget child,
    );

CustomPageBuilderWidget customPageBuilderWidget = (
    BuildContext context,
    GoRouterState state,
    Widget child,
    ) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    transitionDuration: const Duration(milliseconds: 300),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeIn).animate(animation),
        child: child,
      );
    },
  );
};
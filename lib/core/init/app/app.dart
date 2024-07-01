import 'package:bot_toast/bot_toast.dart';
import 'package:dialingo/core/di/dependency_injector.dart';
import 'package:dialingo/core/init/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key, required this.initialRouteName});

  final String initialRouteName;

  @override
  Widget build(BuildContext context) {
    final appRouterConfig = getIt<AppRouter>(param1: initialRouteName);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouterConfig.router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: BotToastInit(),
    );
  }
}

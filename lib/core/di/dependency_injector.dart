import 'package:dialingo/core/constants/enums/router_enums.dart';
import 'package:dialingo/core/init/router/app_router.dart';
import 'package:dialingo/data/local/local_database.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void injectionSetup() {
  getIt.registerFactory(() => LocalDatabase());
  getIt.registerFactoryParam<AppRouter, String, void>((someParameter, _) => AppRouter(RouterEnums.onboardingScreen.routeName));
}

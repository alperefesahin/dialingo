import 'package:dialingo/core/constants/enums/hive_box_name_enums.dart';
import 'package:dialingo/core/constants/enums/router_enums.dart';
import 'package:dialingo/core/di/dependency_injector.dart';
import 'package:dialingo/core/init/app/app.dart';
import 'package:dialingo/data/local/local_database.dart';
import 'package:dialingo/data/local/onboarding/onboarding_hive_model.dart';
import 'package:dialingo/data/repository/di_repository/dependency_injector_repository.dart';
import 'package:dialingo/domain/di_usecase/dependency_injector_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  injectionSetup();
  repositoryInjectionSetup();
  useCaseInjectionSetup();

  final LocalDatabase localdb = getIt<LocalDatabase>();
  final boxName = HiveBoxName.onboarding.boxName;

  await initHive(localdb);

  await localdb.openHiveBox<OnboardingHiveData>(HiveBoxName.onboarding.boxName);

  final box = localdb.getHiveBox<OnboardingHiveData>(boxName);

  final onboardingData = box.get(HiveBoxName.onboarding.boxName);

  final initialRouteName = onboardingData?.isOnboardingCompleted == true
      ? RouterEnums.dashboardScreen.routeName
      : RouterEnums.onboardingScreen.routeName;

  await dotenv.load(fileName: 'keys.env');
  runApp(ProviderScope(child: App(initialRouteName: initialRouteName)));
}

Future<void> initHive(LocalDatabase localdb) async {
  await localdb.start();
}

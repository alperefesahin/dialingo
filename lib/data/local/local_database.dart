import 'package:dialingo/data/local/onboarding/onboarding_hive_model.dart';
import 'package:hive_flutter/adapters.dart';

abstract class ILocalDatabase {
  Future<void> start();

  Future<void> openHiveBox<T>(String boxName);

  void registerAdapter<T>(int typeId, TypeAdapter<T> typeAdapter);

  Box getHiveBox<T>(String boxName);
}

class LocalDatabase implements ILocalDatabase {
  @override
  Future<void> start() async {
    await Hive.initFlutter();

    registerAdapter<OnboardingHiveData>(0, OnboardingHiveDataAdapter());
  }

  @override
  void registerAdapter<T>(int typeId, TypeAdapter<T> typeAdapter) {
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter(typeAdapter);
    }
  }

  @override
  Future<void> openHiveBox<T>(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox<T>(boxName);
    }
  }

  @override
  Box getHiveBox<T>(String boxName) {
    return Hive.box<T>(boxName);
  }
}

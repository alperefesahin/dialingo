import 'package:hive/hive.dart';

part 'onboarding_hive_model.g.dart';

@HiveType(typeId: 0, adapterName: 'OnboardingHiveDataAdapter')
class OnboardingHiveData {
  @HiveField(0)
  final bool isOnboardingCompleted;

  OnboardingHiveData({this.isOnboardingCompleted = false});
}

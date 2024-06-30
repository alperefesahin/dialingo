// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OnboardingHiveDataAdapter extends TypeAdapter<OnboardingHiveData> {
  @override
  final int typeId = 0;

  @override
  OnboardingHiveData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OnboardingHiveData(
      isOnboardingCompleted: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, OnboardingHiveData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isOnboardingCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OnboardingHiveDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

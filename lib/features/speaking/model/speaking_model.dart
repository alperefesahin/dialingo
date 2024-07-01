import 'package:equatable/equatable.dart';

class SpeakingModel extends Equatable {
  final String translatedText;

  const SpeakingModel({required this.translatedText});

  @override
  List<Object> get props => [translatedText];
}
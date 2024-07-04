import 'package:equatable/equatable.dart';

class SpeakingModel extends Equatable {
  final String translatedText;
  final String finishReason;

  const SpeakingModel({required this.translatedText, required this.finishReason});

  @override
  List<Object> get props => [translatedText, finishReason];
}

import 'package:dialingo/features/speaking/model/speaking_model.dart';
import 'package:equatable/equatable.dart';

class SpeakingState extends Equatable {
  const SpeakingState({
    this.speakingModel = const SpeakingModel(translatedText: ''),
    this.error = '',
    this.isLoading = false,
  });

  final SpeakingModel speakingModel;
  final String error;
  final bool isLoading;

  @override
  List<Object> get props => [speakingModel, error, isLoading];

  SpeakingState copyWith({
    SpeakingModel? speakingModel,
    String? error,
    bool? isLoading,
  }) {
    return SpeakingState(
      speakingModel: speakingModel ?? this.speakingModel,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  factory SpeakingState.initial() => const SpeakingState(
        speakingModel: SpeakingModel(translatedText: ''),
        error: '',
        isLoading: false,
      );
}

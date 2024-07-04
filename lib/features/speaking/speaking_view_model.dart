import 'package:dialingo/core/di/dependency_injector.dart';
import 'package:dialingo/domain/usecase/gemini_api/gemini_api_usecase.dart';
import 'package:dialingo/features/speaking/model/speaking_model.dart';
import 'package:dialingo/features/speaking/state/speaking_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final speakingViewModelProvider = StateNotifierProvider<SpeakingViewModel, SpeakingState>((ref) {
  return SpeakingViewModel();
});

class SpeakingViewModel extends StateNotifier<SpeakingState> {
  SpeakingViewModel() : super(SpeakingState.initial());

  final GeminiApiUseCase geminiApiUseCase = getIt<GeminiApiUseCase>();

  void resetState() {
    state = SpeakingState.initial();
  }

  Future<void> translateTextViaPrompt({required String promtFromUser}) async {
    resetState();

    state = state.copyWith(isLoading: true);

    const constantPrompt =
        ''' hello gemini! Please translate the following sentences to desired mentioned language, and tell me 
        the translation exactly, without saying any other sentences, and mentioning the desired language.
        Also translate and give the only core sentences that person says, write the language below in parenthesis''';

    final finalPrompt = '$constantPrompt $promtFromUser';

    try {
      final geminiGenerationModel = await geminiApiUseCase.generateText(text: finalPrompt);

      final speakingModel = SpeakingModel(
        translatedText: geminiGenerationModel.responseTextFromGemini ?? '',
        finishReason: geminiGenerationModel.finishReason ?? '',
      );

      state = state.copyWith(isLoading: false, speakingModel: speakingModel);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

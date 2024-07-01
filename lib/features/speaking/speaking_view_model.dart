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

  void resetState () {
    state = SpeakingState.initial();
  }

  Future<void> translateTextViaPrompt({required String promtFromUser}) async {
    state = state.copyWith(isLoading: true);

    const constantPrompt =
        'hello gemini! Please translate the following sentences to desired mentioned language, and tell me the translation exactly, without saying any other sentences.';
    final finalPrompt = '$constantPrompt $promtFromUser';

    try {
      // to show properly, the loading indicator is working
      await Future.delayed(const Duration(seconds: 2));

      final geminiGenerationModel = await geminiApiUseCase.generateContent(prompt: finalPrompt);

      final speakingModel = SpeakingModel(translatedText: geminiGenerationModel.responseTextFromGemini ?? '');

      state = state.copyWith(isLoading: false, speakingModel: speakingModel);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

import 'package:dialingo/data/repository/gemini_api_repository.dart';
import 'package:dialingo/domain/model/gemini_generation_model.dart';

class GeminiApiUseCase {
  final GeminiApiRepository geminiApiRepository;

  GeminiApiUseCase(this.geminiApiRepository);

  Future<GeminiGenerationModel> generateContent({required String prompt}) async {
    final generateContentResponse = await geminiApiRepository.generateContent(prompt: prompt);

    final GeminiGenerationModel geminiGenerationModel = GeminiGenerationModel(
      responseTextFromGemini: generateContentResponse.text,
      promptFeedback: generateContentResponse.promptFeedback,
    );

    return geminiGenerationModel;
  }
}

import 'package:dialingo/data/repository/gemini_api_repository.dart';
import 'package:dialingo/domain/model/gemini_generation_model.dart';

class GeminiApiUseCase {
  final GeminiApiRepository geminiApiRepository;

  GeminiApiUseCase(this.geminiApiRepository);

  Future<GeminiGenerationModel> generateText({required String text}) async {
    final candidatesResponse = await geminiApiRepository.generateText(text: text);

    final GeminiGenerationModel geminiGenerationModel = GeminiGenerationModel(
      responseTextFromGemini: candidatesResponse?.content?.parts?.last.text,
      index: candidatesResponse?.index,
      finishReason: candidatesResponse?.finishReason,
    );

    return geminiGenerationModel;
  }
}

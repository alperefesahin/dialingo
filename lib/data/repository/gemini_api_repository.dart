import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

abstract class IGeminiApiRepository {
  Future<GenerateContentResponse> generateContent({required String prompt});
}

class GeminiApiRepository extends IGeminiApiRepository {
  final model = GenerativeModel(model: 'gemini-pro-vision', apiKey: dotenv.env['GEMINI_API_KEY']!);

  @override
  Future<GenerateContentResponse> generateContent({required String prompt}) {
    return model.generateContent([Content.text(prompt)]);
  }
}

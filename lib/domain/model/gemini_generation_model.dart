import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiGenerationModel {
  final String? responseTextFromGemini;
  final PromptFeedback? promptFeedback;

  GeminiGenerationModel({required this.responseTextFromGemini, required this.promptFeedback});
}

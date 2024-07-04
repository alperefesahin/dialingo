class GeminiGenerationModel {
  final String? responseTextFromGemini;
  final String? finishReason;
  final int? index;

  GeminiGenerationModel({required this.responseTextFromGemini, required this.index, required this.finishReason});
}

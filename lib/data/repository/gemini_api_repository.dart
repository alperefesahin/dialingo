import 'package:flutter_gemini/flutter_gemini.dart';

abstract class IGeminiApiRepository {
  final Gemini gemini;

  IGeminiApiRepository(this.gemini);

  Future<Candidates?> generateText({required String text});
}

class GeminiApiRepository extends IGeminiApiRepository {
  GeminiApiRepository(super.gemini);

  @override
  Future<Candidates?> generateText({required String text}) {
    return gemini.text(text);
  }
}

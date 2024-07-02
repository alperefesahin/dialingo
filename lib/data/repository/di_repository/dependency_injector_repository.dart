import 'package:dialingo/core/di/dependency_injector.dart';
import 'package:dialingo/data/repository/gemini_api_repository.dart';

void repositoryInjectionSetup() {
  getIt.registerFactory<GeminiApiRepository>(() => GeminiApiRepository(getIt()));
}

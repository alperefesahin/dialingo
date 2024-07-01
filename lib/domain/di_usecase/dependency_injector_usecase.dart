import 'package:dialingo/core/di/dependency_injector.dart';
import 'package:dialingo/data/repository/gemini_api_repository.dart';
import 'package:dialingo/domain/usecase/gemini_api/gemini_api_usecase.dart';

void useCaseInjectionSetup() {
  getIt.registerLazySingleton<GeminiApiUseCase>(() => GeminiApiUseCase(getIt<GeminiApiRepository>()));
}

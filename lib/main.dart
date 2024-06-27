import 'package:dialingo/core/di/dependency_injector.dart';
import 'package:dialingo/core/init/app/app.dart';
import 'package:dialingo/data/di_repository/dependency_injector_repository.dart';
import 'package:dialingo/domain/di_usecase/dependency_injector_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  injectionSetup();
  repositoryInjectionSetup();
  useCaseInjectionSetup();

  runApp(const ProviderScope(child: App()));
}

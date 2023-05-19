import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:quiz_app/data/remote/firebase_database_service.dart';
import 'package:quiz_app/data/remote/quiz_service.dart';
import 'package:quiz_app/data/remote/topic_service.dart';
import 'package:quiz_app/repositories/questions_repository.dart';
import 'package:quiz_app/repositories/topics_repository.dart';

final getIt = GetIt.instance;

class Injector {
  const Injector();

  static Future<void> initialize() async {
    const injector = Injector();
    injector._initializeService();
    injector._initializeRepository();
  }

  void _initializeService() {
    getIt.registerLazySingleton<FirebaseDatabaseService>(
        () => FirebaseDatabaseService());
    getIt.registerLazySingleton<QuizService>(() => QuizService.create());
    getIt.registerLazySingleton<TopicService>(() => TopicService.create());
  }

  void _initializeRepository() {
    getIt.registerLazySingleton<QuestionsRepository>(
        () => QuestionsRepository.create());
    getIt.registerLazySingleton<TopicsRepository>(
        () => TopicsRepository.create());
  }
}

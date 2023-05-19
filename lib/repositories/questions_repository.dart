import 'package:dartz/dartz.dart';
import '../data/remote/quiz_service.dart';
import '../injector.dart';
import '../models/questions/questions_model.dart';

class QuestionsRepository {
  final QuizService _quizService;

  QuestionsRepository(this._quizService);

  factory QuestionsRepository.create() => QuestionsRepository(getIt.get());

  Stream<Either<Exception, QuestionsModel?>> get questionnsStream =>
      _quizService.questionnsStream;
}

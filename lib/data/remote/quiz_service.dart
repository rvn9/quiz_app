import 'dart:collection';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:quiz_app/models/question/question_model.dart';
import 'package:quiz_app/models/questions/questions_model.dart';
import 'package:rxdart/subjects.dart';

import '../../injector.dart';
import 'firebase_database_service.dart';

class QuizService {
  final FirebaseDatabaseService _firebaseDatabaseService;
  final _topicsStream = BehaviorSubject<Either<Exception, List<dynamic>?>>();
  final _questionsStream =
      BehaviorSubject<Either<Exception, QuestionsModel?>>();
  QuizService(this._firebaseDatabaseService);

  factory QuizService.create() => QuizService(getIt.get())..getQuestions();

  void getQuestions() async {
    _firebaseDatabaseService.listen(
      'questions',
      (DataSnapshot snapshot) {
        if (snapshot.exists) {
          try {
            final data = jsonDecode(jsonEncode(snapshot.value));
            final result = QuestionsModel.fromJson(data);
            _questionsStream.add(Right(result));
          } on Exception catch (e) {
            _topicsStream.add(Left(e));
          }
        } else {
          _questionsStream.add(const Right(null));
        }
      },
    );
  }

  Stream<Either<Exception, QuestionsModel?>> get questionnsStream =>
      _questionsStream.asBroadcastStream();
}

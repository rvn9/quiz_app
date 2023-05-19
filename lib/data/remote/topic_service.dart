import 'dart:collection';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:quiz_app/models/question/question_model.dart';
import 'package:rxdart/subjects.dart';

import '../../injector.dart';
import 'firebase_database_service.dart';

class TopicService {
  final FirebaseDatabaseService _firebaseDatabaseService;
  final _topicsStream = BehaviorSubject<Either<Exception, List<dynamic>?>>();

  TopicService(this._firebaseDatabaseService);

  factory TopicService.create() => TopicService(getIt.get())..getTopics();

  void getTopics() async {
    _firebaseDatabaseService.listen('topics', (DataSnapshot snapshot) {
      if (snapshot.exists) {
        try {
          final result = jsonDecode(jsonEncode(snapshot.value));
          _topicsStream.add(Right(result));
        } on Exception catch (e) {
          _topicsStream.add(Left(e));
        }
      } else {
        _topicsStream.add(const Right(null));
      }
    });
  }

  Stream<Either<Exception, List<dynamic>?>> get topicsStream =>
      _topicsStream.asBroadcastStream();
}

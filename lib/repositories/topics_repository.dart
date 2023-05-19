import 'package:dartz/dartz.dart';
import 'package:quiz_app/data/remote/topic_service.dart';

import '../data/remote/quiz_service.dart';
import '../injector.dart';

class TopicsRepository {
  final TopicService _topicService;

  TopicsRepository(this._topicService);

  factory TopicsRepository.create() => TopicsRepository(getIt.get());

  Stream<Either<Exception, List<dynamic>?>> get topicsStream =>
      _topicService.topicsStream;
}

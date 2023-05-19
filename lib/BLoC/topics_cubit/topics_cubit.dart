import 'dart:async';
import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../injector.dart';
import '../../repositories/topics_repository.dart';

part 'topics_cubit.freezed.dart';
part 'topics_state.dart';

class TopicsCubit extends Cubit<TopicsState> {
  final TopicsRepository _topicsRepository;
  TopicsCubit(this._topicsRepository) : super(const TopicsState.initial());

  factory TopicsCubit.create() => TopicsCubit(getIt.get());

  StreamSubscription<Either<Exception, List<dynamic>?>>? _subscription;

  void subscribeTopics() {
    emit(const TopicsState.loading());
    _subscription = _topicsRepository.topicsStream.listen(
      (event) {
        event.fold(
          (l) => emit(
            TopicsState.error(l),
          ),
          (topics) {
            if (topics != null) {
              emit(TopicsState.success(List<String>.from(topics)));
            } else {
              emit(const TopicsState.empty());
            }
          },
        );
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

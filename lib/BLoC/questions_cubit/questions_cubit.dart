import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../injector.dart';
import '../../models/question/question_model.dart';
import '../../models/questions/questions_model.dart';
import '../../repositories/questions_repository.dart';

part 'questions_cubit.freezed.dart';
part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  final QuestionsRepository _questionsRepository;
  final _questions = <QuestionModel>[];
  int _correctAnswer = 0;
  QuestionsCubit(this._questionsRepository)
      : super(const QuestionsState.initial());

  factory QuestionsCubit.create(String topic) =>
      QuestionsCubit(getIt.get())..subscribeQuestions(topic);
  StreamSubscription<Either<Exception, QuestionsModel?>>? _subscription;

  int get correctAnswer => _correctAnswer;

  List<QuestionModel> get questions => _questions;

  void subscribeQuestions(String topic) {
    emit(const QuestionsState.loading());
    _subscription = _questionsRepository.questionnsStream.listen(
      (event) {
        event.fold(
          (l) => emit(
            QuestionsState.error(l),
          ),
          (r) {
            final questions = r?.questions[topic];
            if (questions == null) {
              emit(const QuestionsState.empty());
            } else {
              _questions.addAll(questions);
              emit(QuestionsState.success(questions));
            }
          },
        );
      },
    );
  }

  void setAnswer(String userAnswer, int index) {
    final payload = _questions[index].copyWith(userAnswer: userAnswer);
    _questions[index] = payload;
    if (payload.answer == payload.userAnswer) {
      _correctAnswer += 1;
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

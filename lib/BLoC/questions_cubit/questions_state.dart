part of './questions_cubit.dart';

@freezed
class QuestionsState with _$QuestionsState {
  const factory QuestionsState.initial() = _QuestionsStateInitial;
  const factory QuestionsState.loading() = _QuestionsStateLoading;
  const factory QuestionsState.success(List<QuestionModel> questions) =
      _QuestionsStateSuccess;
  const factory QuestionsState.empty() = _QuestionsStateEmpty;
  const factory QuestionsState.error(Exception error) = _QuestionsStateError;
}

part of './topics_cubit.dart';

@freezed
class TopicsState with _$TopicsState {
  const factory TopicsState.initial() = _TopicsStateInitial;
  const factory TopicsState.loading() = _TopicsStateLoading;
  const factory TopicsState.success(List<String> questions) =
      _TopicsStateSuccess;
  const factory TopicsState.empty() = _TopicsStateEmpty;
  const factory TopicsState.error(Exception error) = _TopicsStateError;
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../question/question_model.dart';

part 'questions_model.freezed.dart';
part 'questions_model.g.dart';

@freezed
class QuestionsModel with _$QuestionsModel {
  factory QuestionsModel({
    required Map<String, List<QuestionModel>> questions,
  }) = _QuestionsModel;

  factory QuestionsModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionsModelFromJson(json);
}

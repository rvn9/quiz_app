// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionsModel _$$_QuestionsModelFromJson(Map<String, dynamic> json) =>
    _$_QuestionsModel(
      questions: (json['questions'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$$_QuestionsModelToJson(_$_QuestionsModel instance) =>
    <String, dynamic>{
      'questions': instance.questions,
    };

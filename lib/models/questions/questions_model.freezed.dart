// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionsModel _$QuestionsModelFromJson(Map<String, dynamic> json) {
  return _QuestionsModel.fromJson(json);
}

/// @nodoc
mixin _$QuestionsModel {
  Map<String, List<QuestionModel>> get questions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionsModelCopyWith<QuestionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionsModelCopyWith<$Res> {
  factory $QuestionsModelCopyWith(
          QuestionsModel value, $Res Function(QuestionsModel) then) =
      _$QuestionsModelCopyWithImpl<$Res, QuestionsModel>;
  @useResult
  $Res call({Map<String, List<QuestionModel>> questions});
}

/// @nodoc
class _$QuestionsModelCopyWithImpl<$Res, $Val extends QuestionsModel>
    implements $QuestionsModelCopyWith<$Res> {
  _$QuestionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questions = null,
  }) {
    return _then(_value.copyWith(
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as Map<String, List<QuestionModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionsModelCopyWith<$Res>
    implements $QuestionsModelCopyWith<$Res> {
  factory _$$_QuestionsModelCopyWith(
          _$_QuestionsModel value, $Res Function(_$_QuestionsModel) then) =
      __$$_QuestionsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, List<QuestionModel>> questions});
}

/// @nodoc
class __$$_QuestionsModelCopyWithImpl<$Res>
    extends _$QuestionsModelCopyWithImpl<$Res, _$_QuestionsModel>
    implements _$$_QuestionsModelCopyWith<$Res> {
  __$$_QuestionsModelCopyWithImpl(
      _$_QuestionsModel _value, $Res Function(_$_QuestionsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questions = null,
  }) {
    return _then(_$_QuestionsModel(
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as Map<String, List<QuestionModel>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionsModel implements _QuestionsModel {
  _$_QuestionsModel({required final Map<String, List<QuestionModel>> questions})
      : _questions = questions;

  factory _$_QuestionsModel.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionsModelFromJson(json);

  final Map<String, List<QuestionModel>> _questions;
  @override
  Map<String, List<QuestionModel>> get questions {
    if (_questions is EqualUnmodifiableMapView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_questions);
  }

  @override
  String toString() {
    return 'QuestionsModel(questions: $questions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionsModel &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_questions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionsModelCopyWith<_$_QuestionsModel> get copyWith =>
      __$$_QuestionsModelCopyWithImpl<_$_QuestionsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionsModelToJson(
      this,
    );
  }
}

abstract class _QuestionsModel implements QuestionsModel {
  factory _QuestionsModel(
          {required final Map<String, List<QuestionModel>> questions}) =
      _$_QuestionsModel;

  factory _QuestionsModel.fromJson(Map<String, dynamic> json) =
      _$_QuestionsModel.fromJson;

  @override
  Map<String, List<QuestionModel>> get questions;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionsModelCopyWith<_$_QuestionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

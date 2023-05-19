// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:quiz_app/models/question/question_model.dart' as _i7;
import 'package:quiz_app/pages/home_page.dart' as _i1;
import 'package:quiz_app/pages/quiz_page.dart' as _i2;
import 'package:quiz_app/pages/result_page.dart' as _i3;
import 'package:quiz_app/pages/topic_page.dart' as _i4;

class AppRouters extends _i5.RootStackRouter {
  AppRouters([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
        opaque: true,
      );
    },
    QuizPageRoute.name: (routeData) {
      final args = routeData.argsAs<QuizPageRouteArgs>();
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.QuizPage(
          key: args.key,
          topic: args.topic,
        ),
        opaque: true,
      );
    },
    ResultPageRoute.name: (routeData) {
      final args = routeData.argsAs<ResultPageRouteArgs>();
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.ResultPage(
          key: args.key,
          correctAnswer: args.correctAnswer,
          questions: args.questions,
        ),
        opaque: true,
      );
    },
    TopicPageRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.TopicPage(),
        opaque: true,
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          HomePageRoute.name,
          path: 'home_page',
        ),
        _i5.RouteConfig(
          QuizPageRoute.name,
          path: 'quiz_page',
        ),
        _i5.RouteConfig(
          ResultPageRoute.name,
          path: 'result_page',
        ),
        _i5.RouteConfig(
          TopicPageRoute.name,
          path: 'topic_page',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomePageRoute extends _i5.PageRouteInfo<void> {
  const HomePageRoute()
      : super(
          HomePageRoute.name,
          path: 'home_page',
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i2.QuizPage]
class QuizPageRoute extends _i5.PageRouteInfo<QuizPageRouteArgs> {
  QuizPageRoute({
    _i6.Key? key,
    required String topic,
  }) : super(
          QuizPageRoute.name,
          path: 'quiz_page',
          args: QuizPageRouteArgs(
            key: key,
            topic: topic,
          ),
        );

  static const String name = 'QuizPageRoute';
}

class QuizPageRouteArgs {
  const QuizPageRouteArgs({
    this.key,
    required this.topic,
  });

  final _i6.Key? key;

  final String topic;

  @override
  String toString() {
    return 'QuizPageRouteArgs{key: $key, topic: $topic}';
  }
}

/// generated route for
/// [_i3.ResultPage]
class ResultPageRoute extends _i5.PageRouteInfo<ResultPageRouteArgs> {
  ResultPageRoute({
    _i6.Key? key,
    required int correctAnswer,
    required List<_i7.QuestionModel> questions,
  }) : super(
          ResultPageRoute.name,
          path: 'result_page',
          args: ResultPageRouteArgs(
            key: key,
            correctAnswer: correctAnswer,
            questions: questions,
          ),
        );

  static const String name = 'ResultPageRoute';
}

class ResultPageRouteArgs {
  const ResultPageRouteArgs({
    this.key,
    required this.correctAnswer,
    required this.questions,
  });

  final _i6.Key? key;

  final int correctAnswer;

  final List<_i7.QuestionModel> questions;

  @override
  String toString() {
    return 'ResultPageRouteArgs{key: $key, correctAnswer: $correctAnswer, questions: $questions}';
  }
}

/// generated route for
/// [_i4.TopicPage]
class TopicPageRoute extends _i5.PageRouteInfo<void> {
  const TopicPageRoute()
      : super(
          TopicPageRoute.name,
          path: 'topic_page',
        );

  static const String name = 'TopicPageRoute';
}

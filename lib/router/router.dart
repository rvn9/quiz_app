import 'package:auto_route/auto_route.dart';
import 'package:quiz_app/pages/home_page.dart';

import '../pages/quiz_page.dart';
import '../pages/result_page.dart';
import '../pages/topic_page.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  HomePage.route,
  QuizPage.route,
  ResultPage.route,
  TopicPage.route,
])
class $AppRouters {}

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../BLoC/questions_cubit/questions_cubit.dart';
import '../router/router.gr.dart';
import '../widget/dots_loading_indicator.dart';

class QuizPage extends StatefulWidget {
  static const route = AdaptiveRoute(
    page: QuizPage,
    path: 'quiz_page',
  );

  final String topic;

  const QuizPage({super.key, required this.topic});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late final QuestionsCubit _questionsCubit;
  late final PageController _pageController;
  late final ValueNotifier<double> _indicatorNotifier;
  late final CountdownController _countdownController;

  @override
  void initState() {
    super.initState();
    _questionsCubit = QuestionsCubit.create(widget.topic);
    _pageController = PageController(initialPage: 0);
    _indicatorNotifier = ValueNotifier(0);
    _countdownController = CountdownController(autoStart: true);
  }

  @override
  void dispose() {
    _questionsCubit.close();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171a38),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF171a38),
        centerTitle: true,
        title: Text(widget.topic),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => AutoRouter.of(context).popUntilRoot(),
            child: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Center(
                child: Text(
                  'Exit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6.0),
          child: ValueListenableBuilder<double>(
            valueListenable: _indicatorNotifier,
            builder: (context, value, child) {
              if (value != 0) {
                return LinearProgressIndicator(
                  backgroundColor: const Color(0xFFffd88f).withOpacity(0.3),
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Color(0xFFffd88f)),
                  value: value,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
      body: BlocProvider.value(
        value: _questionsCubit,
        child: BlocBuilder<QuestionsCubit, QuestionsState>(
          builder: (context, state) => state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            initial: () => const Center(
              child: Text('INITIAL'),
            ),
            loading: () => const Center(
              child: DotsLoadingIndicator(),
            ),
            empty: () => const Center(
              child: Text('KOSONG'),
            ),
            error: (_) => const Center(
              child: Text('ERRORR'),
            ),
            success: (questions) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (currentPage) =>
                    _indicatorNotifier.value += 0.25,
                allowImplicitScrolling: false,
                itemCount: questions.length,
                itemBuilder: (conetxt, questionIndex) {
                  final data = questions[questionIndex];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          height: 300.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: [
                              Text(
                                data.question,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              CachedNetworkImage(
                                height: 200.h,
                                width: double.infinity,
                                fit: BoxFit.contain,
                                imageUrl: 'https://picsum.photos/300/200',
                                imageBuilder: (context, imageProvider) =>
                                    DecoratedBox(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: data.options.length,
                            itemBuilder: (context, optionsIndex) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                decoration: const BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    _questionsCubit.setAnswer(
                                      data.options[optionsIndex],
                                      questionIndex,
                                    );
                                    _countdownController.restart();
                                    _pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut);
                                    if (_indicatorNotifier.value == 1) {
                                      AutoRouter.of(context).popAndPush(
                                        ResultPageRoute(
                                            correctAnswer:
                                                _questionsCubit.correctAnswer,
                                            questions:
                                                _questionsCubit.questions),
                                      );
                                    }
                                  },
                                  child: Text(
                                    data.options[optionsIndex],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.sp,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Countdown(
                          controller: _countdownController,
                          seconds: 30,
                          build: (_, double time) => Text(
                            time.toString(),
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                          interval: const Duration(milliseconds: 100),
                          onFinished: () {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                            if (_indicatorNotifier.value == 1) {
                              AutoRouter.of(context).popAndPush(
                                ResultPageRoute(
                                    correctAnswer:
                                        _questionsCubit.correctAnswer,
                                    questions: _questionsCubit.questions),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

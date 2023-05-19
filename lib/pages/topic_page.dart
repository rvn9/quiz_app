import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../BLoC/topics_cubit/topics_cubit.dart';
import '../router/router.gr.dart';
import '../widget/dots_loading_indicator.dart';

class TopicPage extends StatefulWidget {
  static const route = AdaptiveRoute(
    page: TopicPage,
    path: 'topic_page',
  );

  const TopicPage({super.key});

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  late final TopicsCubit _topicsCubit;

  @override
  void initState() {
    super.initState();
    _topicsCubit = TopicsCubit.create()..subscribeTopics();
  }

  @override
  void dispose() {
    _topicsCubit.close();
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
        title: const Text('Topics'),
      ),
      body: BlocProvider.value(
        value: _topicsCubit,
        child: BlocBuilder<TopicsCubit, TopicsState>(
          builder: (context, state) => state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: DotsLoadingIndicator(),
            ),
            empty: () => const Center(
              child: Text('KOSONG'),
            ),
            error: (_) => const Center(
              child: Text('ERROR'),
            ),
            success: (topics) => ListView.builder(
              itemCount: topics.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF52a8e9),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: ListTile(
                    onTap: () => AutoRouter.of(context)
                        .push(QuizPageRoute(topic: topics[index])),
                    title: Text(
                      topics[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 24.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

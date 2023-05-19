import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

import '../router/router.gr.dart';

class HomePage extends StatefulWidget {
  static const route = AdaptiveRoute(
    page: HomePage,
    path: 'home_page',
  );

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final topics = ['musics', 'politics', 'animals'];
  final _random = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171a38),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.lightbulb_circle_rounded,
              color: Colors.yellow,
              size: 96.0,
            ),
            const SizedBox(
              height: 48,
            ),
            Text(
              'Flutter Quiz App',
              style: TextStyle(
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Learn ● Take Quiz ● Repeat',
              style: TextStyle(
                color: const Color(0xFFFFFFFF),
                fontSize: 12.sp,
              ),
            ),
            const SizedBox(
              height: 96,
            ),
            SizedBox(
              width: 200.w,
              height: 45.h,
              child: ElevatedButton(
                onPressed: () => AutoRouter.of(context)
                    .push(QuizPageRoute(topic: topics[_random.nextInt(3)])),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff4693cc),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Play'),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 200.w,
              height: 45.h,
              child: ElevatedButton(
                onPressed: () =>
                    AutoRouter.of(context).push(const TopicPageRoute()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF171a38),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xff4693cc)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Topics'),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => Share.share('check out this quiz app!'),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.share_rounded,
                        color: Colors.blue,
                        size: 24.0,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Share',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.yellow,
                      size: 24.0,
                    ),
                    Text(
                      ' Rate Us',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

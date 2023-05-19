import 'dart:math' as math;

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

import '../models/question/question_model.dart';

class ResultPage extends StatefulWidget {
  static const route = AdaptiveRoute(
    page: ResultPage,
    path: 'result_page',
  );
  final int correctAnswer;
  final List<QuestionModel> questions;
  const ResultPage({
    super.key,
    required this.correctAnswer,
    required this.questions,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171a38),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF171a38),
        centerTitle: true,
        title: const Text('Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: SizedBox(
                          width: 100.h,
                          height: 100.h,
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(math.pi),
                            child: CircularProgressIndicator(
                              strokeWidth: 8,
                              value: widget.correctAnswer / 5,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.green,
                              ),
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          '${widget.correctAnswer}/5',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            SizedBox(
              width: 150.w,
              height: 40.h,
              child: ElevatedButton(
                onPressed: () => Share.share(
                    'I got ${widget.correctAnswer}/5 correct answers, check this app!'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff4693cc),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Share your score'),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              'Your Report',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.questions.length,
                itemBuilder: (context, index) {
                  final data = widget.questions[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.question,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            if (data.answer != data.userAnswer)
                              Row(
                                children: [
                                  const Icon(
                                    Icons.cancel_rounded,
                                    color: Colors.red,
                                    size: 30.0,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    data.userAnswer ?? 'Tidak Menjawab',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                ],
                              ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.check_circle_rounded,
                                  color: Colors.green,
                                  size: 30.0,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  data.answer,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

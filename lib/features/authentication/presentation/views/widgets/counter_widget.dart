import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/utils/styles.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
    required this.onComplete,
    required this.countDownController,
  });
  final void Function() onComplete;
  final CountDownController countDownController;
  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      onComplete: onComplete,
      width: 66.w,
      height: 66.h,
      controller: countDownController,
      duration: 59,
      initialDuration: 59,
      fillColor: Theme.of(context).colorScheme.primary,
      ringColor: Theme.of(context).colorScheme.secondary,
      strokeWidth: 5,
      isReverse: true,
      textStyle: Styles.textStyle20.copyWith(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

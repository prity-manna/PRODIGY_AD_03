import 'package:flutter/material.dart';
import 'package:stopwatch/components/time_display_card.dart';

class Timer extends StatelessWidget {
  final int hour, minute, second, millisecond;
  const Timer({required this.hour, required this.minute, required this.second, required this.millisecond, super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/logo/logo.png',
                      scale: 15,
                    ),
                  ),
                  TimeDisplayCard(timeName: "Milliseconds",time: millisecond, isMillisecond: true,),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                TimeDisplayCard(timeName: "Hours", time: hour,),
                TimeDisplayCard(timeName: "Minutes",time: minute,),
                TimeDisplayCard(timeName: "Seconds",time: second,),
              ],
            ),
          ],
        )
      );
}
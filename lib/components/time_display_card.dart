import 'package:flutter/material.dart';

class TimeDisplayCard extends StatelessWidget {
  final String timeName;
  final int time;
  final bool isMillisecond;
  const TimeDisplayCard({required this.timeName, required this.time, this.isMillisecond = false, super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text(
        timeName,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 10.0,
      ),
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 12,
              blurStyle: BlurStyle.outer,
              spreadRadius: 2,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Text(
          (isMillisecond) ? ((time < 10) ? "00$time" : ((time < 100) ? "0$time" : "$time")) : (time < 10) ? "0$time" : time.toString(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
            letterSpacing: 3,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
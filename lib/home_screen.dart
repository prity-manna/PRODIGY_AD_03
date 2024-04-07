import 'dart:async' as sys;

import 'package:flutter/material.dart';
import 'package:stopwatch/widgets/activity_widget.dart';
import 'package:stopwatch/widgets/entries_widget.dart';
import 'package:stopwatch/widgets/timer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final sys.StreamController<Map<String,int>> _timerController;
  late final Stopwatch _stopwatch;
  late bool isEnabled;
  late List<Map<String, int>> laps;

  @override
  void initState() {
    super.initState();
    isEnabled = false;
    laps = List<Map<String, int>>.empty(growable: true);
    _timerController = sys.StreamController(sync: true);
    _stopwatch = Stopwatch();
  }

  Future<void> _startTimer() async {
    int millisecond = _stopwatch.elapsed.inMilliseconds;
    _timerController.sink.add({
      'hour' : (((millisecond ~/ 1000) ~/ 60) ~/ 24),
      'minute' : ((millisecond ~/ 1000) ~/ 60),
      'second' : ((millisecond ~/ 1000) % 60),
      'millisecond' : (millisecond % 1000),
    });
  }

  @override
  void dispose() {
    isEnabled = false;
    laps.clear();
    _timerController.close();
    _stopwatch.stop();
    _stopwatch.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Column(
        children: [

          // Title
          Container(
            padding: const EdgeInsets.all(15.0),
            child: const Text(
              "Stopwatch",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
          ),
          
          // Timer Widget
          StreamBuilder<Map<String,int>>(
            stream: _timerController.stream,
            builder: (context, snapshot) {
              return Timer(
                hour: snapshot.data != null ? snapshot.data!['hour'] != null ? snapshot.data!['hour']! : 0 : 0,
                minute: snapshot.data != null ? snapshot.data!['minute'] != null ? snapshot.data!['minute']! : 0 : 0,
                second: snapshot.data != null ? snapshot.data!['second'] != null ? snapshot.data!['second']! : 0 : 0,
                millisecond: snapshot.data != null ? snapshot.data!['millisecond'] != null ? snapshot.data!['millisecond']! : 0 : 0,
              );
            }
          ),
      
          // Entries Widget
          Entries(
            laps: laps,
          ),
      
          // Timer Activity Widget
          Activities(
            isEnabled: isEnabled,
            onPressed: () {
              (!isEnabled) ? _stopwatch.start() : _stopwatch.stop();
              setState(() => isEnabled = !isEnabled);
              sys.Timer.periodic(const Duration(milliseconds: 1), (_) {
                if (isEnabled) _startTimer();
              });
            },
            takeLap: () {
              if (!isEnabled) return;
              int millisecond = _stopwatch.elapsed.inMilliseconds;
              setState(() => laps.add({
                'hour': (((millisecond ~/ 1000) ~/ 60) ~/ 60),
                'minute' : ((millisecond ~/ 1000) ~/ 60),
                'second' : ((millisecond ~/ 1000) % 60),
                'millisecond' : (millisecond % 1000)
              }));
            },
            resetAll: () {
              if (isEnabled) return;
              laps.clear();
              _stopwatch.reset();
              _startTimer();
              setState(() {});
            },
          ),

        ],
      ),
    ),
  );
}
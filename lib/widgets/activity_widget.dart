import 'package:flutter/material.dart';
import '../components/icon_button.dart' as comp;

class Activities extends StatelessWidget {
  final bool isEnabled;
  final Function? onPressed;
  final Function? takeLap;
  final Function? resetAll;
  const Activities({required this.isEnabled, this.onPressed, this.takeLap, this.resetAll, super.key});

  Future<void> _takeLog() async {
    if (!isEnabled) return;
    await takeLap!();
  }

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        comp.IconButton(
          icon: Icons.my_location,
          isEnabled: isEnabled,
          onPressed: () async => await _takeLog(),
        ),
        comp.IconButton(
          icon: isEnabled ? Icons.pause : Icons.play_arrow,
          onPressed: () async => await onPressed!(),
        ),
        comp.IconButton(
          icon: Icons.refresh,
          isEnabled: !isEnabled,
          onPressed: () async => await resetAll!(),
        ),
      ],
    ),
  );
}
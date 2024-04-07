import 'package:flutter/material.dart';

class IconButton extends StatelessWidget {
  final IconData? icon;
  final bool isEnabled;
  final Function? onPressed;
  const IconButton({required this.icon, this.isEnabled = true, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => (isEnabled) ? onPressed!() : null,
    child: Icon(
      icon,
      color: isEnabled ? Colors.black : Colors.grey,
    ),
  );
}
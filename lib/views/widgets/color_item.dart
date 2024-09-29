import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isChosen, required this.color});
  final bool isChosen;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: isChosen ? Colors.white : color,
      radius: 32,
      child: CircleAvatar(
        backgroundColor: color,
        radius: 28,
      ),
    );
  }
}

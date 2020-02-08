import 'package:flutter/material.dart';

class CircleShape extends StatelessWidget {
  final Color color;
  final Widget child;
  double r = 30;

  CircleShape({this.color, this.child, this.r});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      height: r,
      width: r,
      child: child,
    );
  }
}

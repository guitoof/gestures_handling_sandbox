import 'package:flutter/material.dart';
import 'package:gestures_handling_sandbox/widgets/translucent_colored_box.dart';

class Circle extends StatelessWidget {
  final double size;
  final Color color;
  final Widget? child;

  const Circle(
      {Key? key, required this.size, this.color = Colors.lightBlue, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: TranslucentColoredBox(
        shape: ShapeType.circle,
        color: color,
        child: child,
      ),
    );
  }
}

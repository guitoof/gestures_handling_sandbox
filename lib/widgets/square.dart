import 'package:flutter/material.dart';
import 'package:gestures_handling_sandbox/widgets/translucent_colored_box.dart';

class Square extends StatelessWidget {
  final double size;
  final Color color;
  final Widget? child;

  const Square(
      {Key? key, required this.size, this.color = Colors.lightBlue, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: TranslucentColoredBox(
        color: color,
        child: child,
      ),
    );
  }
}

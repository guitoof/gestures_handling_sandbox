import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final double size;
  final Color color;
  final Widget? child;

  const Square(
      {Key? key, required this.size, this.color = Colors.lightBlue, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: size,
      height: size,
      child: child,
    );
  }
}

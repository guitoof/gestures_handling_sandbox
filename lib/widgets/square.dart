import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final double size;

  const Square({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      width: size,
      height: size,
    );
  }
}
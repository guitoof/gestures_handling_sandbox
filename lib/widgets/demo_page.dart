import 'package:flutter/material.dart';

const _verticalOffset = 60.0;

class DemoPage extends StatelessWidget {
  final Widget child;
  final double demoSquareSize;
  final Offset demoSquarePosition;

  const DemoPage({Key? key, required this.child, required this.demoSquareSize, required this.demoSquarePosition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final initialPosition = Offset(
      MediaQuery.of(context).size.width / 2 - demoSquareSize / 2,
      MediaQuery.of(context).size.height / 2 - demoSquareSize / 2 - _verticalOffset,
    );
    return Stack(
          children: [
            Positioned(
              top:initialPosition.dy + demoSquarePosition.dy,
              left:initialPosition.dx + demoSquarePosition.dx,
              child: child,
            ),
          ],
    
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gestures_handling_sandbox/models/square.dart';
import 'package:gestures_handling_sandbox/widgets/demo_page.dart';
import 'package:gestures_handling_sandbox/widgets/detected_gesture_dialog.dart';
import 'package:gestures_handling_sandbox/widgets/square.dart';

const double _squareSize = 200;

const ShapeData backSquare = ShapeData(size: 200, color: Colors.purple);
const ShapeData frontSquare = ShapeData(size: 100, color: Colors.amber);

class StackedDisambiguationPage extends StatefulWidget {
  const StackedDisambiguationPage({Key? key}) : super(key: key);

  @override
  State<StackedDisambiguationPage> createState() =>
      _StackedDisambiguationPageState();
}

class _StackedDisambiguationPageState extends State<StackedDisambiguationPage> {
  double horizontalOffset = 0.0;
  double verticalOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          DemoPage(
            demoSquareSize: _squareSize,
            demoSquarePosition: Offset(horizontalOffset, verticalOffset),
            child: Stack(children: [
              Listener(
                behavior: HitTestBehavior.opaque,
                onPointerDown: (event) => showDetectedGestureDialog(
                  'Tap',
                  from: 'Back',
                  color: backSquare.color,
                  context: context,
                ),
                child: Square(
                  size: backSquare.size,
                  color: backSquare.color,
                ),
              ),
              Listener(
                behavior: HitTestBehavior.opaque,
                onPointerDown: (event) => showDetectedGestureDialog(
                  'Tap',
                  from: 'Front',
                  color: frontSquare.color,
                  context: context,
                ),
                child: Square(
                  size: frontSquare.size,
                  color: frontSquare.color,
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}

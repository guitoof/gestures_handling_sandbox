import 'package:flutter/material.dart';
import 'package:gestures_handling_sandbox/models/square.dart';
import 'package:gestures_handling_sandbox/widgets/demo_page.dart';
import 'package:gestures_handling_sandbox/widgets/detected_gesture_dialog.dart';
import 'package:gestures_handling_sandbox/widgets/square.dart';

/// Code Example from: https://github.com/flutter/flutter/issues/74733#issuecomment-767859584
///
/// Widget Tree:
/// --------------------
///
/// Stack
/// |   |
/// A   B
///     |
///     C
///
///
/// Frontal View
/// --------------------
///
///  +------+
///  | (  ) |
///  +------+
///
///
/// Side View
///
/// ---------------------
///    |     |     |     .
///    |     |     |     |
///    |     |     |     '
///  Stack   A     B     C
///
///

const ShapeData shapeA = ShapeData(size: 200, color: Colors.purple);
const ShapeData shapeB = ShapeData(size: 150, color: Colors.blue);
const ShapeData shapeCircle = ShapeData(size: 100, color: Colors.amber);

class ListenerDisambiguationPage extends StatefulWidget {
  const ListenerDisambiguationPage({Key? key}) : super(key: key);

  @override
  State<ListenerDisambiguationPage> createState() =>
      _ListenerDisambiguationPageState();
}

class _ListenerDisambiguationPageState
    extends State<ListenerDisambiguationPage> {
  double horizontalOffset = 0.0;
  double verticalOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DemoPage(
          demoSquareSize: shapeA.size,
          child: Stack(children: [
            Listener(
              onPointerDown: (event) => showDetectedGestureDialog(
                'Tap',
                from: 'A (back)',
                color: shapeA.color,
                context: context,
              ),
              behavior: HitTestBehavior.opaque,
              child: Square(
                size: shapeA.size,
                color: shapeA.color,
              ),
            ),
            Center(
              child: Listener(
                onPointerDown: (event) => showDetectedGestureDialog(
                  'Tap',
                  from: 'B (front)',
                  color: shapeB.color,
                  context: context,
                ),
                behavior: HitTestBehavior.deferToChild,
                child: Square(
                  size: shapeB.size,
                  color: shapeB.color,
                  child: Center(
                    child: Listener(
                      onPointerDown: (event) => showDetectedGestureDialog(
                        'Tap',
                        from: 'C (front child)',
                        color: shapeCircle.color,
                        context: context,
                      ),
                      behavior: HitTestBehavior.opaque,
                      child: Square(
                        size: shapeCircle.size,
                        color: shapeCircle.color,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ],
    );
  }
}

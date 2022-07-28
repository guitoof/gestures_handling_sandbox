import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gestures_handling_sandbox/widgets/demo_page.dart';
import 'package:gestures_handling_sandbox/widgets/detected_gesture_dialog.dart';
import 'package:gestures_handling_sandbox/widgets/square.dart';

const double _squareSize = 100;

class RawGestureDetectorExamplePage extends StatefulWidget {
  const RawGestureDetectorExamplePage({Key? key}) : super(key: key);

  @override
  State<RawGestureDetectorExamplePage> createState() =>
      _RawGestureDetectorExamplePageState();
}

class _RawGestureDetectorExamplePageState
    extends State<RawGestureDetectorExamplePage> {
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
            child: RawGestureDetector(
              behavior: HitTestBehavior.translucent,
              gestures: {
                TapGestureRecognizer:
                    GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
                  () => TapGestureRecognizer(),
                  (TapGestureRecognizer instance) {
                    instance.onTap = () => showDetectedGestureDialog('Tap',
                        from: 'RawGestureDetector', context: context);
                  },
                )
              },
              child: const Square(size: _squareSize),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gestures_handling_sandbox/modules/basic_demo/pages/raw_gesture_detector_example_page/triple_tap_gesture_recognizer.dart';
import 'package:gestures_handling_sandbox/widgets/demo_page.dart';
import 'package:gestures_handling_sandbox/widgets/detected_gesture_dialog.dart';
import 'package:gestures_handling_sandbox/widgets/square.dart';
import 'package:gestures_handling_sandbox/modules/basic_demo/pages/raw_gesture_detector_example_page/rotation_gesture_recognizer.dart';

const double _squareSize = 200;

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

  double rotationAngle = 0.0;

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
                RotateGestureRecognizer: GestureRecognizerFactoryWithHandlers<
                    RotateGestureRecognizer>(
                  () => RotateGestureRecognizer()
                    ..onRotationUpdate = (RotationUpdateDetails details) {
                      setState((() {
                        rotationAngle = details.angle;
                      }));
                    },
                  (RotateGestureRecognizer instance) {},
                ),
                TripleTapGestureRecognizer:
                    GestureRecognizerFactoryWithHandlers<
                        TripleTapGestureRecognizer>(
                  () => TripleTapGestureRecognizer()
                    ..onTripleTap = () {
                      showDetectedGestureDialog('👇👇👇 Triple Tap',
                          from: 'RawGestureDetector',
                          color: Colors.lightBlue,
                          context: context);
                    },
                  (TripleTapGestureRecognizer instance) {},
                )
              },
              child: Transform.rotate(
                angle: rotationAngle,
                child: const Square(size: _squareSize),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

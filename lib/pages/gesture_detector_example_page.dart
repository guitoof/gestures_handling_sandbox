import 'package:flutter/material.dart';
import 'package:gestures_handling_sandbox/widgets/demo_page.dart';
import 'package:gestures_handling_sandbox/widgets/detected_gesture_dialog.dart';
import 'package:gestures_handling_sandbox/widgets/square.dart';

const double _squareSize = 100;

class GestureDetectorExamplePage extends StatefulWidget {
  const GestureDetectorExamplePage({Key? key}) : super(key: key);

  @override
  State<GestureDetectorExamplePage> createState() =>
      _GestureDetectorExamplePageState();
}

class _GestureDetectorExamplePageState
    extends State<GestureDetectorExamplePage> {
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
            child: GestureDetector(
                onTap: () => showDetectedGestureDialog('Tap', from: 'GestureDetector',context: context),
                onDoubleTap: () =>
                    showDetectedGestureDialog('Double Tap', from: 'GestureDetector', context: context),
                onLongPress: () =>
                    showDetectedGestureDialog('Long Press', from: 'GestureDetector', context: context),
                onHorizontalDragUpdate: (details) => setState(() {
                  horizontalOffset += details.delta.dx;
                }),
                onHorizontalDragEnd: (_) {
                  setState(() {
                    horizontalOffset = 0.0;
                  });
                  showDetectedGestureDialog('Horizontal Drag', from: 'GestureDetector', context: context);
                },
                onVerticalDragUpdate: (details) => setState(() {
                  verticalOffset += details.delta.dy;
                }),
                onVerticalDragEnd: (_) {
                  setState(() {
                    verticalOffset = 0.0;
                  });
                  showDetectedGestureDialog('Vertical Drag', from: 'GestureDetector', context: context);
                },
                child: const Square(size: _squareSize),
              ),
            
          ),
        ],
      ),
    );
  }
}

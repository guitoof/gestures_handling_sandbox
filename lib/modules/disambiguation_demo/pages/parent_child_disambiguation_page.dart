import 'package:flutter/material.dart';
import 'package:gestures_handling_sandbox/widgets/demo_page.dart';
import 'package:gestures_handling_sandbox/widgets/detected_gesture_dialog.dart';
import 'package:gestures_handling_sandbox/widgets/square.dart';

class SquareData {
  final double size;
  final Color color;

  const SquareData({required this.size, required this.color});
}

const SquareData parentSquare = SquareData(size: 200, color: Colors.red);
const SquareData childSquare = SquareData(size: 100, color: Colors.blue);

class ParentChildDisambiguationPage extends StatefulWidget {
  const ParentChildDisambiguationPage({Key? key}) : super(key: key);

  @override
  State<ParentChildDisambiguationPage> createState() =>
      _ParentChildDisambiguationPageState();
}

class _ParentChildDisambiguationPageState
    extends State<ParentChildDisambiguationPage> {
  double horizontalOffset = 0.0;
  double verticalOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          DemoPage(
            demoSquareSize: parentSquare.size,
            child: GestureDetector(
              onTap: () => showDetectedGestureDialog(
                'Tap',
                from: 'Parent',
                color: parentSquare.color,
                context: context,
              ),
              child: Square(
                size: parentSquare.size,
                color: parentSquare.color,
                child: Center(
                    child: GestureDetector(
                  onTap: () => showDetectedGestureDialog(
                    'Tap',
                    from: 'Child',
                    color: childSquare.color,
                    context: context,
                  ),
                  child: Square(
                    size: childSquare.size,
                    color: childSquare.color,
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

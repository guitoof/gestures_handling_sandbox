import 'package:flutter/material.dart';
import 'package:gestures_handling_sandbox/widgets/demo_page.dart';
import 'package:gestures_handling_sandbox/widgets/detected_gesture_dialog.dart';
import 'package:gestures_handling_sandbox/widgets/square.dart';

const double _squareSize = 200;

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
            child: const Center(child: Text('🚧')),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gestures_handling_sandbox/widgets/detected_gesture_dialog.dart';
import 'package:gestures_handling_sandbox/widgets/square.dart';

const double _squareSize = 30;

class ListenerDisambiguationPage extends StatefulWidget {
  const ListenerDisambiguationPage({Key? key}) : super(key: key);

  @override
  State<ListenerDisambiguationPage> createState() =>
      _ListenerDisambiguationPageState();
}

class _ListenerDisambiguationPageState
    extends State<ListenerDisambiguationPage> {
  Offset? pointerPosition;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Listener(
        onPointerDown: (event) => setState(() {
          pointerPosition = event.localPosition;
        }),
        onPointerMove: (event) => setState(() {
          pointerPosition = event.localPosition;
        }),
        onPointerUp: (event) => setState(() {
          pointerPosition = null;
          showDetectedGestureDialog(
            'Gesture',
            from: 'Listener',
            color: Colors.amber,
            context: context,
          );
        }),
        behavior: HitTestBehavior.translucent,
        child: Center(
          child: ElevatedButton(
            child: const Text('Tap'),
            onPressed: () => showDetectedGestureDialog(
              'Tap',
              from: 'Button',
              color: Colors.blue,
              context: context,
            ),
          ),
        ),
      ),
      if (pointerPosition != null)
        Positioned(
          top: pointerPosition!.dy,
          left: pointerPosition!.dx,
          child: const Square(size: _squareSize, color: Colors.amber),
        )
    ]);
  }
}

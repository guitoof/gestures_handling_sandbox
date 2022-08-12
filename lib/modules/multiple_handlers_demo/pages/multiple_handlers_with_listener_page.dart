import 'package:flutter/material.dart';
import 'package:gestures_handling_sandbox/widgets/detected_gesture_dialog.dart';

const double _squareSize = 60;

class MultipleHandlersWithListenerPage extends StatefulWidget {
  const MultipleHandlersWithListenerPage({Key? key}) : super(key: key);

  @override
  State<MultipleHandlersWithListenerPage> createState() =>
      MultipleHandlersWithListenerPageState();
}

class MultipleHandlersWithListenerPageState
    extends State<MultipleHandlersWithListenerPage> {
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
          top: pointerPosition!.dy - _squareSize / 2,
          left: pointerPosition!.dx - _squareSize / 2,
          child: Container(
            width: _squareSize,
            height: _squareSize,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber,
            ),
          ),
        )
    ]);
  }
}

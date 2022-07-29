import 'package:flutter/material.dart';
import 'package:gestures_handling_sandbox/widgets/square.dart';

const double _squareSize = 30;

class ListenerExamplePage extends StatefulWidget {
  const ListenerExamplePage({Key? key}) : super(key: key);

  @override
  State<ListenerExamplePage> createState() => _ListenerExamplePageState();
}

class _ListenerExamplePageState extends State<ListenerExamplePage> {
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
        }),
        behavior: HitTestBehavior.opaque,
      ),
      if (pointerPosition != null)
        Positioned(
          top: pointerPosition!.dy,
          left: pointerPosition!.dx,
          child: const Square(size: _squareSize),
        )
    ]);
  }
}

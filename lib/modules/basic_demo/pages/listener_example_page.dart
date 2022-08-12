import 'package:flutter/material.dart';

const double _squareSize = 60;

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
        onPointerHover: (event) {},
        onPointerSignal: (event) {},
        onPointerCancel: (event) {},
        behavior: HitTestBehavior.opaque,
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

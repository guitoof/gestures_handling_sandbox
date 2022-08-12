import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

abstract class GestureCallback {
  void call(dynamic details);
}

class MockGestureCallback extends Mock implements GestureCallback {}

void main() {
  group('Listener', () {
    testWidgets(
      'should call "onPointer..." callbacks when receiving a vertical drag gesture',
      (WidgetTester tester) async {
        final gestureCallback = MockGestureCallback();
        await tester.pumpWidget(Listener(
          behavior: HitTestBehavior.opaque,
          onPointerDown: gestureCallback,
          onPointerMove: gestureCallback,
          onPointerUp: gestureCallback,
        ));

        const startPosition = Offset(100, 100);
        final gesture = await tester.startGesture(startPosition);
        await gesture.moveBy(const Offset(0, 100));
        await gesture.up();

        verify(() => gestureCallback(any())).called(3);
      },
    );
  });
}

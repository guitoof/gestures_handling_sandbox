import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

abstract class TapGestureCallback {
  void call();
}

abstract class DragGestureCallback {
  void call(dynamic details);
}

class MockTapGestureCallback extends Mock implements TapGestureCallback {}

class MockDragGestureCallback extends Mock implements DragGestureCallback {}

void main() {
  group('GestureDetector', () {
    testWidgets(
      'should call "onTap" when receiving a tap gesture',
      (WidgetTester tester) async {
        final tapCallback = MockTapGestureCallback();
        await tester.pumpWidget(GestureDetector(
          onTap: tapCallback,
        ));
        await tester.fling(
          find.byType(GestureDetector),
          const Offset(0, 100),
          1000,
        );

        verify(() => tapCallback()).called(1);
      },
    );

    testWidgets(
      'should call "onVerticalDragStart" when receiving a vertical drag gesture',
      (WidgetTester tester) async {
        final gestureCallback = MockDragGestureCallback();
        await tester.pumpWidget(GestureDetector(
          onVerticalDragStart: (gestureCallback),
          onVerticalDragUpdate: (gestureCallback),
          onVerticalDragEnd: (gestureCallback),
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

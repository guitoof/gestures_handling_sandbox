import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

abstract class TapGestureCallback {
  void call();
}

abstract class DragGestureCallback {
  void call(dynamic details);
}

abstract class HoverGestureCallback {
  void call(dynamic details);
}

class MockTapGestureCallback extends Mock implements TapGestureCallback {}

class MockDragGestureCallback extends Mock implements DragGestureCallback {}

class MockHoverGestureCallback extends Mock implements HoverGestureCallback {}

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

  group('MouseRegion', () {
    testWidgets(
      'fails when trying to add a second pointer as mouse can have single pointer only',
      (WidgetTester tester) async {
        try {
          final hoverCallback = MockHoverGestureCallback();
          await tester.pumpWidget(MouseRegion(
            onHover: hoverCallback,
          ));
          var gesture1 = await tester.createGesture(pointer: 1, kind: PointerDeviceKind.mouse);
          var gesture2 = await tester.createGesture(pointer: 2, kind: PointerDeviceKind.mouse);
          await gesture1.addPointer(location: Offset.zero);
          await gesture2.addPointer(location: Offset.zero);
          addTearDown(gesture1.removePointer);
          addTearDown(gesture2.removePointer);
          await gesture1.moveTo(const Offset(0, 100));
          await gesture2.moveTo(const Offset(0, 100));

          expect(true, false); // didn't found widget test that expects an error
        } on AssertionError catch (cause) {
          expect(
            cause.toString(),
            ''''package:flutter/src/rendering/mouse_tracker.dart': '''
            '''Failed assertion: line 227 pos 12: '''
            ''''(event is PointerAddedEvent) == (lastEvent is PointerRemovedEvent)': is not true.''',
          );
        }
      },
    );
    testWidgets(
      'calls "onHover" for two individual devices',
      (WidgetTester tester) async {
        final hoverCallback = MockHoverGestureCallback();
        await tester.pumpWidget(MouseRegion(
          onHover: hoverCallback,
        ));
        var gesture = await tester.createGesture(pointer: 1, kind: PointerDeviceKind.mouse);
        await gesture.updateWithCustomEvent(
          const PointerHoverEvent(device: 1, position: Offset.zero, kind: PointerDeviceKind.mouse),
        );
        await gesture.updateWithCustomEvent(
          const PointerHoverEvent(device: 2, position: Offset.zero, kind: PointerDeviceKind.mouse),
        );

        verify(() => hoverCallback(any())).called(2);
      },
    );
  });
}

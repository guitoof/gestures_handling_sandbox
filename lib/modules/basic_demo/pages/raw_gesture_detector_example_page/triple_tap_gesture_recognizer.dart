import 'dart:async';

import 'package:flutter/gestures.dart';

class TripleTapGestureRecognizer extends GestureRecognizer {
  Timer? countdown;
  int tapCounter = 0;
  static const Duration countdownDuration = Duration(milliseconds: 500);

  void Function()? onTripleTap;

  @override
  void addAllowedPointer(PointerEvent event) {
    GestureBinding.instance.pointerRouter
        .addRoute(event.pointer, _handleEvent, event.transform);
  }

  void _handleEvent(PointerEvent event) {
    if (event is PointerDownEvent) {
      _processPointerDownEvent(event);
    } else if (event is PointerUpEvent) {
      _processPointerUpEvent(event);
    }
  }

  void _processPointerDownEvent(PointerDownEvent event) {
    _resetCountdown();
  }

  void _processPointerUpEvent(PointerUpEvent event) {
    tapCounter++;
    if (tapCounter == 3) {
      _resetCounter();
      _stopCountdown();
      onTripleTap?.call();
    }
  }

  void _resetCountdown() {
    countdown?.cancel();
    countdown = Timer(countdownDuration, () {
      tapCounter = 0;
    });
  }

  void _resetCounter() {
    tapCounter = 0;
  }

  void _stopCountdown() {
    countdown?.cancel();
    countdown = null;
  }

  @override
  void acceptGesture(int pointer) {}

  @override
  void rejectGesture(int pointer) {}

  @override
  String get debugDescription => 'Triple Tap';

  @override
  void dispose() {
    // _tapsTracker?.timer?.cancel();
    _stopCountdown();
    super.dispose();
  }
}

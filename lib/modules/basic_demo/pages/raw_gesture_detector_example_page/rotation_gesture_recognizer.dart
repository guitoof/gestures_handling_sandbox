import 'package:flutter/gestures.dart';

class RotationUpdateDetails {
  double angle;
  RotationUpdateDetails({required this.angle});
}

typedef GestureRotateStartCallback = void Function();
typedef GestureRotateUpdateCallback = void Function(
    RotationUpdateDetails details);
typedef GestureRotateEndCallback = void Function();

class RotateGestureRecognizer extends ScaleGestureRecognizer {
  GestureRotateStartCallback? onRotationStart;

  GestureRotateUpdateCallback? onRotationUpdate;

  GestureRotateEndCallback? onRotationEnd;

  @override
  GestureScaleStartCallback? get onStart => _scaleStarts;
  @override
  GestureScaleUpdateCallback? get onUpdate => _scaleUpdates;
  @override
  GestureScaleEndCallback? get onEnd => _scaleEnds;

  void _scaleStarts(ScaleStartDetails details) {
    onRotationStart?.call();
  }

  void _scaleUpdates(ScaleUpdateDetails details) {
    onRotationUpdate?.call(RotationUpdateDetails(angle: details.rotation));
  }

  void _scaleEnds(ScaleEndDetails details) {
    onRotationEnd?.call();
  }
}

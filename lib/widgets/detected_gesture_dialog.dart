import 'package:flutter/material.dart';

class DetectedGestureDialog extends StatelessWidget {
  final String detectedGestureName;
  final String gestureDetectionSource;

  const DetectedGestureDialog(this.detectedGestureName, { this.gestureDetectionSource = '', Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('$detectedGestureName detected from $gestureDetectionSource !'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('👌'),
        ),
      ],
    );
  }
}

Future<String?> showDetectedGestureDialog(String detectedGestureName, {String from = '', required BuildContext context}) =>
    showDialog<String>(
      context: context,
      builder: (BuildContext context) =>
          DetectedGestureDialog(detectedGestureName, gestureDetectionSource: from),
    );

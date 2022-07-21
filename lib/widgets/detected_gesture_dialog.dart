import 'package:flutter/material.dart';

class DetectedGestureDialog extends StatelessWidget {
  final String detectedGestureName;

  const DetectedGestureDialog(this.detectedGestureName, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('$detectedGestureName detected !'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('👌'),
        ),
      ],
    );
  }
}

Future<String?> showDetectedGestureDialog(String detectedGestureName,
        {required BuildContext context}) =>
    showDialog<String>(
      context: context,
      builder: (BuildContext context) =>
          DetectedGestureDialog(detectedGestureName),
    );

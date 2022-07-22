import 'package:flutter/material.dart';

class DetectedGestureDialog extends StatelessWidget {
  final String detectedGestureName;
  final String gestureDetectionSource;
  final Color? color;

  const DetectedGestureDialog(
    this.detectedGestureName, {
    this.gestureDetectionSource = '',
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: RichText(
        text: TextSpan(style: DefaultTextStyle.of(context).style, children: [
          TextSpan(
              text: detectedGestureName,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const TextSpan(text: ' detected from '),
          TextSpan(
              text: '$gestureDetectionSource !',
              style: TextStyle(fontWeight: FontWeight.bold, color: color))
        ]),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('👌'),
        ),
      ],
    );
  }
}

Future<String?> showDetectedGestureDialog(
  String detectedGestureName, {
  String from = '',
  Color? color,
  required BuildContext context,
}) =>
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => DetectedGestureDialog(
          detectedGestureName,
          gestureDetectionSource: from,
          color: color),
    );

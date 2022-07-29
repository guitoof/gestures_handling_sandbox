import 'package:flutter/material.dart';
import './app.dart';

void main() {
  runApp(const SanboxApp());
}

class SanboxApp extends StatefulWidget {
  const SanboxApp({Key? key}) : super(key: key);

  @override
  State<SanboxApp> createState() => _SanboxAppState();
}

class _SanboxAppState extends State<SanboxApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Understanding Flutter\'s handling of Gestures',
      home: App(),
    );
  }
}

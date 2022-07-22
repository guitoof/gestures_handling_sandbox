import 'package:flutter/material.dart';
import 'package:gestures_handling_sandbox/pages/gesture_detector_example_page.dart';
import 'package:gestures_handling_sandbox/pages/listener_example_page.dart';
import 'package:gestures_handling_sandbox/pages/raw_gesture_detector_example_page.dart';

void main() {
  runApp(const SanboxApp());
}

class SanboxApp extends StatefulWidget {
  const SanboxApp({Key? key}) : super(key: key);

  @override
  State<SanboxApp> createState() => _SanboxAppState();
}

class _SanboxAppState extends State<SanboxApp> {
  int currentPageIndex = 0;

  static const _pages = [
    {
      'widget': GestureDetectorExamplePage(),
      'name': 'GestureDetector',
      'icon': Icon(Icons.line_style_outlined)
    },
    {
      'widget': RawGestureDetectorExamplePage(),
      'name': 'RawGestureDetector',
      'icon': Icon(Icons.gesture)
    },
    // {
    //   'widget': ListenerExamplePage(),
    //   'name': 'Listener',
    //   'icon': Icon(Icons.moving_sharp)
    // },
  ];

  @override
  Widget build(BuildContext context) {
    final currentPage = _pages[currentPageIndex];

    return MaterialApp(
      title: 'Understanding Flutter\'s handling of Gestures',
      home: Scaffold(
        body: (currentPage['widget'] as Widget),
        appBar: AppBar(title: Text(currentPage['name'] as String)),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPageIndex,
          onTap: (tappedIndex) => setState(() {
            currentPageIndex = tappedIndex;
          }),
          items: _pages
              .map(
                (page) => BottomNavigationBarItem(
                  icon: page['icon'] as Icon,
                  label: page['name'] as String,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

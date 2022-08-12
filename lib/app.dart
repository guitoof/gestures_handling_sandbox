import 'package:flutter/material.dart';
import 'package:gestures_handling_sandbox/modules/basic_demo/basic_demo.dart';
import 'package:gestures_handling_sandbox/modules/disambiguation_demo/disambiguation_demo.dart';
import 'package:gestures_handling_sandbox/modules/disambiguation_demo/pages/listener_disambiguation_page.dart';
import 'package:gestures_handling_sandbox/modules/multiple_handlers_demo/multiple_handlers_demo.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  static const _sections = {
    'basicGestureDetectionDemo': {
      'title': 'Basic Gesture Detection',
      'icon': Icon(Icons.swipe_left),
      'pages': [
        {
          'widget': GestureDetectorExamplePage(),
          'name': 'GestureDetector',
          'icon': Icon(Icons.swipe_down)
        },
        {
          'widget': RawGestureDetectorExamplePage(),
          'name': 'RawGestureDetector',
          'icon': Icon(Icons.gesture)
        },
        {
          'widget': ListenerExamplePage(),
          'name': 'Listener',
          'icon': Icon(Icons.swipe_right_alt)
        },
      ]
    },
    'disambiguationDemo': {
      'title': 'Disambiguation',
      'icon': Icon(Icons.line_style),
      'pages': [
        {
          'widget': ParentChildDisambiguationPage(),
          'name': 'Parent Child Disambiguation',
          'icon': Icon(Icons.featured_video)
        },
        {
          'widget': StackedDisambiguationPage(),
          'name': 'Stacked Disambiguation',
          'icon': Icon(Icons.filter_none)
        },
        {
          'widget': ListenerDisambiguationPage(),
          'name': 'Listener Disambiguation',
          'icon': Icon(Icons.flip_to_back)
        },
      ]
    },
    'multipleHandlers': {
      'title': 'Multiple Handlers',
      'icon': Icon(Icons.multiline_chart),
      'pages': [
        {
          'widget': MultipleHandlersWithListenerPage(),
          'name': 'Multiple Handlers with Parent-Child Listeners',
          'icon': Icon(Icons.flip_to_back)
        },
        {
          'widget': MultipleHandlersWithListenerPage(),
          'name': 'Multiple Handlers with Stacked Listeners',
          'icon': Icon(Icons.flip_to_back)
        },
      ]
    }
  };

  String currentSectionKey = 'basicGestureDetectionDemo';
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final currentSection = _sections[currentSectionKey];
    if (currentSection == null) {
      return const Center(child: Text('No section selected'));
    }
    final currentPage = (currentSection['pages'] as List)[currentPageIndex];

    return Scaffold(
      body: (currentPage['widget'] as Widget),
      appBar: AppBar(title: Text(currentPage['name'] as String)),
      drawer: Drawer(
        child: ListView(
          children: _sections
              .map((sectionKey, section) {
                return MapEntry(
                  sectionKey,
                  ListTile(
                    title: Text(section['title'] as String),
                    leading: section['icon'] as Icon,
                    onTap: () {
                      setState(() {
                        currentPageIndex = 0; // Reset page index
                        currentSectionKey = sectionKey;
                      });
                      Navigator.pop(context);
                    },
                  ),
                );
              })
              .values
              .toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (tappedIndex) => setState(() {
          currentPageIndex = tappedIndex;
        }),
        items: (_sections[currentSectionKey]!['pages'] as List)
            .map(
              (page) => BottomNavigationBarItem(
                icon: page['icon'] as Icon,
                label: page['name'] as String,
              ),
            )
            .toList(),
      ),
    );
  }
}

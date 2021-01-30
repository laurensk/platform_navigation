import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platform_navigation/platform_screen.dart';

/// Navigation for Android.
class NavAndroid extends StatefulWidget {
  final String title;
  final List<PlatformScreen> screens;

  NavAndroid({this.title, this.screens});

  @override
  _NavAndroidState createState() => _NavAndroidState();
}

class _NavAndroidState extends State<NavAndroid> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: current,
          onTap: (index) {
            setState(() {
              current = index;
            });
          },
          items: [
            for (int i = 0; i < widget.screens.length; i++)
              BottomNavigationBarItem(
                icon: Icon(widget.screens[i].materialIcon),
                label: widget.screens[i].title,
              ),
          ],
        ),
        body: widget.screens[current].child);
  }
}

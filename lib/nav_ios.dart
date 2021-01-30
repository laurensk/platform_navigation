import 'package:flutter/cupertino.dart';
import 'package:platform_navigation/platform_screen.dart';

/// Navigation for iOS.
class NavIos extends StatefulWidget {
  final String title;
  final List<PlatformScreen> screens;

  NavIos({this.title, this.screens});

  @override
  _NavIosState createState() => _NavIosState();
}

class _NavIosState extends State<NavIos> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          for (int i = 0; i < widget.screens.length; i++)
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 3),
                child: Icon(
                  widget.screens[i].cupertinoIcon,
                  size: 25.0,
                ),
              ),
              label: widget.screens[i].title,
            ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                leading: widget.screens[index].leading,
                trailing: widget.screens[index].trailing,
                middle: Text(
                  widget.screens[index].title,
                ),
              ),
              child: SafeArea(
                child: widget.screens[index].child,
              ),
            );
          },
        );
      },
    );
  }
}

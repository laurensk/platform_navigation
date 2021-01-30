import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platform_navigation/platform_screen.dart';
import 'package:responsive_scaffold/responsive_scaffold.dart';

/// Navigation for Web.
class NavWeb extends StatefulWidget {
  final String title;
  final List<PlatformScreen> screens;

  NavWeb({this.title, this.screens});

  @override
  _NavWebState createState() => _NavWebState();
}

class _NavWebState extends State<NavWeb> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    PlatformScreen currentScreen = widget.screens[current];
    return ResponsiveScaffold(
      appBarElevation: 0,
      title: Text(currentScreen.title),
      trailing: Row(
        children: [
          currentScreen.leading != null ? currentScreen.leading : Container(),
          currentScreen.trailing != null ? currentScreen.trailing : Container()
        ],
      ),
      drawer: ListView(
        children: <Widget>[
          AppBar(
            elevation: 0,
            title: Text(widget.title),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          for (int i = 0; i < widget.screens.length; i++)
            ListTile(
              selected: current == i,
              selectedTileColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[800]
                  : Color(0xffE6E6E6),
              leading: Icon(widget.screens[i].materialIcon,
                  color: Theme.of(context).accentColor),
              title: Text(
                widget.screens[i].title,
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
              onTap: () {
                setState(() {
                  current = i;
                });
              },
            ),
        ],
      ),
      body: widget.screens[current].child,
    );
  }
}

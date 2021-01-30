import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_navigation/platform_navigation.dart';
import 'package:platform_navigation/platform_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) return getMaterialApp();
    if (Platform.isIOS)
      return getCupertinoApp();
    else
      return getMaterialApp();
  }

  getMaterialApp() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Platform Navigation',
      theme: ThemeData(brightness: Brightness.light, backgroundColor: Colors.white, accentColor: Colors.black),
      darkTheme: ThemeData(brightness: Brightness.dark, backgroundColor: Colors.black, accentColor: Colors.white),
      home: getNavigation(),
    );
  }

  getCupertinoApp() {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: getNavigation(),
      theme: CupertinoThemeData(),
      title: 'Platform Navigation',
    );
  }

  getNavigation() {
    return PlatformNavigation(title: "My App", screens: [
      PlatformScreen(
          title: "Home",
          child: Container(color: Colors.white, child: Center(child: Text("Welcome at Home!"))),
          materialIcon: Icons.home,
          cupertinoIcon: CupertinoIcons.home),
      PlatformScreen(
          title: "Settings",
          child: Center(child: Text("This is the settings screen.")),
          materialIcon: Icons.settings,
          cupertinoIcon: CupertinoIcons.settings),
      PlatformScreen(
          title: "About",
          child: Center(child: Text("About this app!")),
          materialIcon: Icons.info,
          cupertinoIcon: CupertinoIcons.info)
    ]);
  }
}

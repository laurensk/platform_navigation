library platform_navigation;

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:platform_navigation/nav_android.dart';
import 'package:platform_navigation/nav_ios.dart';
import 'package:platform_navigation/nav_web.dart';
import 'package:platform_navigation/platform_screen.dart';

/// Create navigation for all platforms. Takes a title and a list of screens.
class PlatformNavigation extends StatelessWidget {
  final String title;
  final List<PlatformScreen> screens;

  PlatformNavigation({this.title, this.screens});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) return NavWeb(title: title, screens: webScreens());
    if (Platform.isIOS) return NavIos(title: title, screens: mobileScreens());
    if (Platform.isAndroid) return NavAndroid(title: title, screens: mobileScreens());
    return NavWeb(title: title, screens: screens);
  }

  webScreens() {
    return screens.where((s) {
      if (s.hideOnWeb == null) return true;
      return !s.hideOnWeb;
    }).toList();
  }

  mobileScreens() {
    return screens.where((s) {
      if (s.hideOnMobile == null) return true;
      return !s.hideOnMobile;
    }).toList();
  }
}

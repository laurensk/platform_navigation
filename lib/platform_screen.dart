import 'package:flutter/widgets.dart';

/// Screen wrapper used by PlatformNavigation.
class PlatformScreen {
  /// Title is used in App Bars.
  String title;

  /// Renders your actual screen.
  Widget child;

  /// Leading widget for App Bars (optional).
  Widget leading;

  /// Trailing widget for App Bars (optional).
  Widget trailing;

  /// Show or hide screen on mobile (optional).
  bool hideOnMobile;

  /// Show or hide screen on web (optional).
  bool hideOnWeb;

  /// Icon to use in Material design.
  IconData materialIcon;

  /// Icon to use in Cupertino design.
  IconData cupertinoIcon;

  PlatformScreen(
      {@required this.title,
      @required this.child,
      this.leading,
      this.trailing,
      this.hideOnMobile,
      this.hideOnWeb,
      @required this.materialIcon,
      @required this.cupertinoIcon});
}

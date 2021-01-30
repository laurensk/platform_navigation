# Flutter Platform Navigation

<p>
  <img alt="Version" src="https://img.shields.io/badge/pub-1.0.1-blue.svg?cacheSeconds=2592000" />
  <img src="https://img.shields.io/badge/flutter-%3E%3D1.17.0-blue.svg" />
  <a href="https://docs.mathology.org" target="_blank">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" />
  </a>
  <a href="https://github.com/kefranabg/readme-md-generator/graphs/commit-activity" target="_blank">
    <img alt="Maintenance" src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" />
  </a>
</p>

This library allows you to implement navigation for iOS, Android and Web with ease! It is easy to use and intended to get started quickly. Please have a look at the example below.

## Example

```dart
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
```

## Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/laurensk/platform_navigation/issues).

## Show your support

Give a ⭐️ on [GitHub](https://github.com/laurensk/platform_navigation) if this project helped you!

## License

Copyright © [Laurens Kropf](https://github.com/laurensk).<br />
This project is [MIT](https://github.com/laurensk/platform_navigation/blob/master/LICENSE) licensed.
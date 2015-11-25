library tekartik_platform_context.context;

import 'package:pub_semver/pub_semver.dart';

abstract class Browser {
  bool get isIe;
  bool get isFirefox;
  bool get isSafari;

  bool get isChrome;
  bool get isChromeDartium;
  bool get isChromeChromium;

  // browser version
  Version get version;

  // If the browser contain the dart vm
  bool get isDartVm;

  // Mobile browser version;
  bool get isMobile;

  // Desktop
  bool get isWindows;
  bool get isMac;
  bool get isLinux;
}

abstract class Io {
  bool get isWindows;
  bool get isMac;
  bool get isLinux;
  bool get isAndroid;
}

abstract class PlatformContext {
  // non null if in a browser
  Browser get browser;

  // non null if in io
  Io get io;

  // for debugging
  Map toMap();
}

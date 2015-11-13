library tekartik_platform_context.context_browser;

import 'context.dart';
import 'src/browser_detect.dart';
import 'package:pub_semver/pub_semver.dart';

class _Browser implements Browser {
  BrowserDetect _detect = new BrowserDetect();

  String get navigatorText {
    String navigator;
    if (isIe) {
      navigator = 'ie';
    } else if (isFirefox) {
      navigator = 'firefox';
    } else if (isChrome) {
      if (isChromeDartium) {
        navigator = 'dartium';
      } else if (isChromeChromium) {
        navigator = 'chromium';
      } else {
        navigator = 'chrome';
      }
    } else if (isSafari) {
      navigator = 'safari';
    }
    return navigator;
  }

  Version get version => _detect.browserVersion;

  @override
  String toString() => toMap().toString();

  Map toMap() {
    Map map = {};
    map['navigator'] = navigatorText;
    map['version'] = version.toString();
    if (isDartVm) {
      map['dartVm'] = true;
    }
    return map;
  }

  @override
  bool get isIe => _detect.isIe;

  @override
  bool get isFirefox => _detect.isFirefox;

  @override
  bool get isSafari => _detect.isSafari;

  @override
  bool get isChrome => _detect.isChrome;
  @override
  bool get isChromeChromium => _detect.isChromeChromium;
  @override
  bool get isChromeDartium => _detect.isChromeDartium;

  // Ugly way to test if running as dart or javascript
  @override
  bool get isDartVm => !identical(1.0, 1);
}

class _IoPlatformContext implements PlatformContext {
  Io get io => null;

  // non null if in io
  final _Browser browser = new _Browser();

  @override
  String toString() => toMap().toString();

  @override
  Map toMap() {
    Map map = {'browser': browser.toMap()};
    return map;
  }
}

final PlatformContext browserPlatformContext = new _IoPlatformContext();

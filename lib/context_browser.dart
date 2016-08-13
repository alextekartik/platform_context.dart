library tekartik_platform_context.context_browser;

import 'context.dart';
import 'src/browser_detect.dart';
import 'package:pub_semver/pub_semver.dart';
export 'context.dart';

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

  @override
  Version get version => _detect.browserVersion;

  @override
  String toString() => toMap().toString();

  Map toMap() {
    Map map = {};
    map['navigator'] = navigatorText;
    map['version'] = version.toString();
    String platform = _platformText;
    if (_platformText != null) {
      map['platform'] = platform;
    }
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
  bool get isDartVm => !isRunningAsJavascript;

  @override
  bool get isMobile => _detect.isMobile;

  @override
  bool get isWindows => _detect.isWindows;

  @override
  bool get isMac => _detect.isMac;

  @override
  bool get isLinux => _detect.isLinux;

  String get _platformText {
    String platform;
    if (isWindows) {
      platform = 'windows';
    } else if (isMac) {
      platform = 'mac';
    } else if (isLinux) {
      platform = 'linux';
    }
    return platform;
  }
}

class _BrowserPlatformContext implements PlatformContext {
  Io get io => null;

  // non null if in io
  final _Browser browser = new _Browser();

  _BrowserPlatformContext() {
    browser._detect.init();
  }

  @override
  String toString() => toMap().toString();

  @override
  Map toMap() {
    Map map = {'browser': browser.toMap()};
    return map;
  }
}

PlatformContext _browserPlatformContext;
PlatformContext get browserPlatformContext => _browserPlatformContext ??= new _BrowserPlatformContext();

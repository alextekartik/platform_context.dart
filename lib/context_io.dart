library tekartik_platform_context.context_io;

import 'context.dart';
import 'dart:io';

class _Io implements Io {
  ///
  /// true if windows operating system
  ///
  @override
  bool get isWindows => Platform.isWindows;

  ///
  /// true if OS X operating system
  ///
  @override
  bool get isMac => Platform.isMacOS;

  ///
  /// true if Linux operating system
  ///
  @override
  bool get isLinux => Platform.isLinux;

  ///
  /// true if Android operating system
  ///
  @override
  bool get isAndroid => Platform.isAndroid;

  ///
  /// get the version as string
  ///
  String get versionText => Platform.version;

  String get _platformText {
    String platform;
    if (isLinux) {
      platform = 'linux';
    } else if (isMac) {
      platform = 'mac';
    } else if (isWindows) {
      platform = 'windows';
    } else if (isAndroid) {
      platform = 'android';
    }
    return platform;
  }

  @override
  String toString() => toMap().toString();

  Map toMap() {
    Map map = {};
    map['platform'] = _platformText;
    return map;
  }
}

class _IoPlatformContext implements PlatformContext {
  Browser get browser => null;

  // non null if in io
  _Io io = new _Io();

  @override
  String toString() => '[io] $io';

  @override
  Map toMap() {
    Map map = {'io': io.toMap()};
    return map;
  }
}

final PlatformContext ioPlatformContext = new _IoPlatformContext();

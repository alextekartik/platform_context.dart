import 'package:platform_context/context.dart';

import 'dart:core' hide print;

Function print;

run(PlatformContext context) {
  if (context.io != null) {
    if (context.io.isWindows) {
      print('We are on Windows');
    } else if (context.io.isMac) {
      print('We are on Mac');
    } else if (context.io.isLinux) {
      print('We are on Linux');
    } else if (context.io.isAndroid) {
      print('We are on Android');
    }
  }
  if (context.browser != null) {
    if (context.browser.isChrome) {
      print('We are on Chrome');
    } else if (context.browser.isSafari) {
      print('We are on Safari');
    } else if (context.browser.isFirefox) {
      print('We are on Firefox');
    } else if (context.browser.isIe) {
      print('We are on IE/Edga');
    }

    if (context.browser.isWindows) {
      print('We are on Windows');
    }

    if (context.browser.isDartVm) {
      print('We are running on Dart VM');
    } else {
      print('We are running on Javascript VM');
    }
  }
}

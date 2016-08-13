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

    print('version ${context.browser.version}');

    if (context.browser.isWindows) {
      print('We are on Windows');
    } else if (context.browser.isMac) {
      print('We are on Mac');
    } else if (context.browser.isLinux) {
      print('We are on Linux');
    }

    if (context.browser.isMobile) {
      print('We are on Mobile');
    }

    if (context.browser.isDartVm) {
      print('We are running on a browser Dart VM');
    } else {
      print('We are running on a browser with a Javascript VM');
    }
  }
}

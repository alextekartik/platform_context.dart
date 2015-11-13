# platform context

Helper to figure out the platform context (browser/io, windows/mac/linux, ie/firefox/chrome, dartvm/js)

The `PlatformContext` object can be used in both browser and io application to test the current environment

## Setup

### IO application

```dart
import 'package:platform_context/context_io.dart';

main() {
  run(ioPlatformContext);
}
```

### Browser application

```
import 'package:platform_context/context_browser.dart';

main() {
  run(browserPlatformContext);
}
```

## Usage

then you can use the `PlatformContext` object later in your application. The following code can run both on browser and 
io application

```dart
import 'package:platform_context/context.dart';

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

    if (context.browser.isDartVm) {
      print('We are running on Dart VM');
    } else {
      print('We are running on Javascript VM');
    }
  }
}
```

## Dev information


Tools

```
pub global activate ghpages_generator
```

Build

```
pub build example
```

Deplay to gh-pages

```
generate_ghpages --with-examples
```

Check result

```
# switch to gh-pages branch
git checkout gh-pages
# switch to master branch
git checkout master
```
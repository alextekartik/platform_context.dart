@TestOn("browser")
library string_enum_test;

//import 'package:tekartik_utils/dev_utils.dart';
import 'package:dev_test/test.dart';
import 'package:platform_context/context_browser.dart';

void main() {
  group('context', () {
    //PlatformContext context = browserPlatformContext;

    test('browser', () {
      print(browserPlatformContext.browser.isMobile);
    });
  });
}

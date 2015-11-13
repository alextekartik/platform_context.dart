@TestOn("!vm")
library string_enum_test;

//import 'package:tekartik_utils/dev_utils.dart';
import 'package:platform_context/context_browser.dart';
import 'package:platform_context/context.dart';
import 'package:dev_test/test.dart';

void main() {
  group('context', () {
    PlatformContext context = browserPlatformContext;

    test('chrome', () {
      expect(context.browser.isChrome, isTrue);
      expect(context.browser.isChromeDartium, isFalse);
      expect(context.browser.isChromeChromium, isFalse);
      expect(context.browser.isDartVm, isFalse);
    }, testOn: "chrome");

    test('dartium', () {
      expect(context.browser.isChrome, isTrue);
      expect(context.browser.isChromeDartium, isTrue);
      expect(context.browser.isChromeChromium, isFalse);
      expect(context.browser.isDartVm, isTrue);
    }, testOn: "dartium || content-shell");

    test('firefox', () {
      expect(context.browser.isFirefox, isTrue);
      expect(context.browser.isDartVm, isFalse);
    }, testOn: "firefox");

    test('ie', () {
      expect(context.browser.isIe, isTrue);
      expect(context.browser.isDartVm, isFalse);
    }, testOn: "ie");

    test('safari', () {
      expect(context.browser.isSafari, isTrue);
      expect(context.browser.isDartVm, isFalse);
    }, testOn: "safari");
  });
}

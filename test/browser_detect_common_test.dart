library browser_detect_utils_common_test;

//import 'package:tekartik_utils/dev_utils.dart';
import 'package:platform_context/src/browser_detect_common.dart';
import 'package:dev_test/test.dart';
import 'package:pub_semver/pub_semver.dart';

void main() => defineTests();

void defineTests() {
  group('browser_detect', () {
    BrowserDetectCommon browserDetect = new BrowserDetectCommon();

    _checkSingleBrowser() {
      if (browserDetect.isChrome) {
        expect(
            browserDetect.isIe ||
                browserDetect.isFirefox ||
                browserDetect.isSafari,
            isFalse);
      }
      if (browserDetect.isSafari) {
        expect(
            browserDetect.isIe ||
                browserDetect.isFirefox ||
                browserDetect.isChrome,
            isFalse);
      }
      if (browserDetect.isIe) {
        expect(
            browserDetect.isSafari ||
                browserDetect.isFirefox ||
                browserDetect.isChrome,
            isFalse);
      }
      if (browserDetect.isFirefox) {
        expect(
            browserDetect.isIe ||
                browserDetect.isSafari ||
                browserDetect.isChrome,
            isFalse);
      }
    }
    tearDown(() {
      // Cleanup any change
      browserDetect.userAgent = null;
    });

    test('safari', () {
      // OS X 10.10.5
      browserDetect.userAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.1.56 (KHTML, like Gecko) Version/9.0 Safari/601.1.56';
      expect(browserDetect.isSafari, isTrue);
      expect(browserDetect.browserVersion, new Version(9, 0, 0));
      expect(browserDetect.isMobile, isFalse);
      _checkSingleBrowser();
    });

    test('ie', () {
      browserDetect.userAgent =
          'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; .NET4.0E; .NET4.0C; .NET CLR 3.5.30729; .NET CLR 2.0.50727; .NET CLR 3.0.30729; Tablet PC 2.0; MALNJS; rv:11.0) like Gecko';
      expect(browserDetect.isIe, isTrue);
      expect(browserDetect.browserVersion, new Version(7, 0, 0));
      expect(browserDetect.isMobile, isFalse);
      _checkSingleBrowser();
    });

    test('ie_edge', () {
      browserDetect.userAgent =
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36 Edge/12.0';
      expect(browserDetect.isIe, isTrue);
      expect(browserDetect.browserVersion, new Version(12, 0, 0));
      expect(browserDetect.isMobile, isFalse);
      _checkSingleBrowser();
    });

    test('firefox', () {
      browserDetect.userAgent =
          'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0';
      expect(browserDetect.isFirefox, isTrue);
      expect(browserDetect.browserVersion, new Version(29, 0, 0));
      expect(browserDetect.isMobile, isFalse);
      _checkSingleBrowser();
    });

    test('chrome', () {
      browserDetect.userAgent =
          'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36';
      expect(browserDetect.isChrome, isTrue);
      expect(browserDetect.isChromeChromium, isFalse);
      expect(browserDetect.isChromeDartium, isFalse);
      expect(browserDetect.isMobile, isFalse);
      expect(
          browserDetect.browserVersion, new Version(36, 0, 1985, build: '125'));
      _checkSingleBrowser();
    });

    test('chromium', () {
      browserDetect.userAgent =
          "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/45.0.2454.101 Chrome/45.0.2454.101 Safari/537.36";
      expect(browserDetect.isChromeChromium, isTrue);
      expect(browserDetect.isChromeDartium, isFalse);
      expect(browserDetect.isChrome, isTrue);
      expect(browserDetect.isMobile, isFalse);
      expect(
          browserDetect.browserVersion, new Version(45, 0, 2454, build: '101'));
      _checkSingleBrowser();
    });
    test('chrome_dartium', () {
      browserDetect.userAgent =
          'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.0 (Dart) Safari/537.36';
      expect(browserDetect.isChromeDartium, isTrue);
      expect(browserDetect.isChromeChromium, isFalse);
      expect(browserDetect.isChrome, isTrue);
      expect(browserDetect.isMobile, isFalse);
      expect(
          browserDetect.browserVersion, new Version(37, 0, 2062, build: '0'));
      _checkSingleBrowser();
    });

    test('mobile', () {
      // iOS9 Safari
      browserDetect.userAgent =
          "Mozilla/5.0 (iPhone; CPU iPhone OS 9_0 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13A344 Safari/601.1";
      expect(browserDetect.isMobile, isTrue);
      expect(browserDetect.isSafari, isTrue);
      expect(browserDetect.browserVersion, new Version(9, 0, 0));
      expect(browserDetect.isMobileAndroid, isFalse);
      expect(browserDetect.isSafari, isTrue);
      _checkSingleBrowser();

      // Chrome iOS
      browserDetect.userAgent =
          "Mozilla/5.0 (iPhone; CPU iPhone OS 8_2 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12D508 Safari/600.1.4";
      expect(browserDetect.isMobileIOS, isTrue);
      expect(browserDetect.isMobileAndroid, isFalse);
      expect(browserDetect.isSafari, isTrue);
      _checkSingleBrowser();

      // Chrome Android 6
      browserDetect.userAgent =
          'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36';
      expect(browserDetect.isMobile, isTrue);
      expect(browserDetect.isChrome, isTrue);
      expect(browserDetect.isMobileIOS, isFalse);
      expect(browserDetect.isMobileAndroid, isTrue);
      expect(
          browserDetect.browserVersion, new Version(46, 0, 2490, build: "76"));
      _checkSingleBrowser();
    });
  });
}

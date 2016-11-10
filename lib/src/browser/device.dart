import '../browser_detect_common.dart';
import '../../context.dart' as context;

class Device implements context.BrowserDevice {
  final BrowserDetectCommon _detect;
  Device(this._detect) {}

  @override
  bool get isMobile => _detect.isMobile;

  @override
  bool get isIPad => _detect.isMobileIPad;

  @override
  bool get isIPhone => _detect.isMobileIPhone;

  @override
  bool get isIPod => _detect.isMobileIPod;

  /*
  @override
  bool get isFormatTablet => _detect.isFormatTablet;
  */
}

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class FontManager {

  /// Shared object which is used. No new instances are created for this class
  static final FontManager _shared = FontManager._internal();

  /// Factory returns `_shared` object for every
  /// instantiation like `FontManager()`
  factory FontManager() {
    return _shared;
  }

  /// Private constructor
  FontManager._internal();

  /// Disables `allowRuntimeFetching` and uses local assets
  /// and registers the used font with `LicenseRegistry`
  init() async {
    // Do not allow fetching fonts from internet instead use from assets
    GoogleFonts.config.allowRuntimeFetching = false;

    // License requirement for using Google Fonts
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('google_fonts/barlow/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('google_fonts/merriweather/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });
  }
}
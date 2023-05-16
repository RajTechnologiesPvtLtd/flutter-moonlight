import 'dart:io';

class AppConfig {
  static String name = "MoonLight";

  static String shareTheAppMsg = "check out my website https://example.com";
  static String rateThisAppLink =
      "http://play.google.com/store/apps/details?id=com.rajtechnologies.StockMarketProfitCalculator";

  // Google Mobile Ads Start
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
    // Google Mobile Ads End
  }
}

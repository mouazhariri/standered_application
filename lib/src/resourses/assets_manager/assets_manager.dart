import 'package:standered_application/src/core/utils/extenssion/assets_extension.dart';

class AppImages {
  static const String _assetsImagesPath = 'assets/images';
  String get assetImagesPath => _assetsImagesPath;
  static String image = 'path_to_image'.asAssetsImage;
  static String empyData = 'empty_data.svg'.asAssetsImage;
  static String emptyScreen = 'im_empty_screen.png'.asAssetsImage;
  static String errorScreen = 'im_error_screen.png'.asAssetsImage;
}

class AppIcons {
  static const String _assetsIconsPath = 'assets/icons';
  String get assetsIconsPath => _assetsIconsPath;
  static String icon = 'path_to_icon'.asAssetsIcons;
}

class AppLottie {
  static const String _assetsLottiePath = 'assets/lottie';
  String get assetsLottiePath => _assetsLottiePath;
  static String loadingWhite = 'ic_loading_white.json'.asAssetsLottie;
  static String loadingPrimary = 'ic_loading_primary.json'.asAssetsLottie;
  static String successWhite = 'ic_success_white.json'.asAssetsLottie;
}

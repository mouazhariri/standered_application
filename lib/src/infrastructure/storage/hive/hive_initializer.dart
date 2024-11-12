import 'dart:ui';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:standered_application/src/infrastructure/storage/hive/hive_boxes.dart';
import 'package:standered_application/src/infrastructure/storage/hive/hive_type_ids.dart';
import 'package:standered_application/src/logger/log_services/dev_logger.dart';

abstract class HiveInitializer {
  static Future<void> initialize() async {
    // await Hive.deleteFromDisk();
    Dev.logLine('HiveInitializer');
    try {
      // await Hive.deleteFromDisk();
      var documentsDirectory = await getApplicationDocumentsDirectory();
      Hive.init(documentsDirectory.path);
      bool isNotRegistered(int typeId) {
        return !Hive.isAdapterRegistered(typeId);
      }

      // //* Register Adapters
      // if (isNotRegistered(HiveTypeIds.userSettingsTypId)) {
      //   Hive.registerAdapter<UserSettings>(UserSettingsAdapter());
      // }

      // if (isNotRegistered(HiveTypeIds.userInfoTypId)) {
      //   Hive.registerAdapter<UserInformation>(UserInformationAdapter());
      // }
      // if (isNotRegistered(HiveTypeIds.themeType)) {
      //   Hive.registerAdapter<AppThemeType>(AppThemeTypeAdapter());
      // }

      //? Open Boxes
      // await Hive.openBox<UserSettings>(HiveBoxesName.userSettingsBox);
      // await Hive.openBox<UserInformation>(HiveBoxesName.userInfoBox);
      // await Hive.openBox<LocationInfo>(HiveBoxesName.userInfoBox);
      // // await Hive.openBox<Cart>(HiveBoxesName.cartBox);
      // await Hive.deleteBoxFromDisk(HiveBoxesName.cartBox);
      // Dev.logLine('Delete done');

      Dev.logSuccess('FINISH HiveInitializer');
    } catch (e) {
      Dev.logError('HiveInitializer Error $e');
    }
  }
}

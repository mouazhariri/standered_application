import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:standered_application/src/application/di/injection.dart';
import 'package:standered_application/src/infrastructure/api/endpoint/base_urls.dart';
import 'package:standered_application/src/infrastructure/storage/hive/hive_initializer.dart';

abstract class AppInitilaizer {
  static init() async {
    //-- Flutter init --
    WidgetsFlutterBinding.ensureInitialized();
    //-- ENV FILE LOAD  --
    await dotenv.load(fileName: ".env");

    //-- Hive initialize --
    await Hive.initFlutter();
    await HiveInitializer.initialize();
    //-- Dependency inijection  --
    configurationDependencies();
    //-- Localization init  --
    await EasyLocalization.ensureInitialized();
    //-- Load base URL's  --
    BaseUrls.init();
  }
}

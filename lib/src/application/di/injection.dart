import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:standered_application/src/application/di/injection.config.dart';
import 'package:standered_application/src/infrastructure/network/dio_remote_interceptor.dart';

GetIt sl = GetIt.instance;

@module
abstract class RegisterModule {
  @LazySingleton()
  Dio get dio => getDio();

  @lazySingleton
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();
}

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configurationDependencies() async {
  sl = $initGetIt(sl);
}

Dio getDio() {
  Dio dio = Dio();
  dio.interceptors.clear();
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ),
  );
  dio.interceptors.add(RemoteInterceptor());

  return dio;
}
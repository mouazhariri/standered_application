import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:standered_application/generated/codegen_loader.g.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/i18n',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('en'),
      saveLocale: true,
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            supportedLocales: context.supportedLocales,
            builder: BotToastInit(),
            localizationsDelegates: context.localizationDelegates,
            locale: EasyLocalization.of(context)!.locale,
            // routerConfig: AppRouter.getRouter,
            // theme: AppThemes.currentTheme,
            // darkTheme: AppThemes.darkTheme,
            title: 'Flutter Demo',
            themeMode: ThemeMode.light,
          );
        },
      ),
    );
  }
}
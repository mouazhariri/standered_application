import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:standered_application/src/application/di/injection.dart';
import 'package:standered_application/src/core/utils/constants/constants.dart';
import 'package:standered_application/src/core/utils/constants/messages/app_messages.dart';
import 'package:standered_application/src/core/widgets/default_button.dart';
import 'package:standered_application/src/infrastructure/storage/local_storage.dart';
import 'package:standered_application/src/logger/log_services/dev_logger.dart';
import 'package:standered_application/src/resourses/color_manager/color_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final LocalStorage localeStorage = sl<LocalStorage>();
  String? token;
  void getToken() async =>
      token = await localeStorage.getSecuredString(StorageKeys.securedToken);
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    ColorProvider colorProvider = ColorProvider();
    getToken();
    Dev.logLine(token);
    return Scaffold(
      backgroundColor: colorProvider.background,
      appBar: AppBar(
        title: Text(
          token == '' ? "Welcome to my Home page" : "Welcome again",
        ),
      ),
      body: Column(
        children: [
          Container(
            width: 100.w,
            height: 100.h,
            color: colorProvider.darker,
          ),
          20.verticalSpace,
          DefaultButton(
              height: 50.h,
              width: 200.w,
              content: Text(
                "Generate token",
                style: theme.textTheme.displayMedium!
                    .copyWith(color: colorProvider.surface),
              ),
              onTap: () async {
                await localeStorage.setSecuredString(
                    StorageKeys.securedToken, "eeeemmmmmkkkk");
              })
        ],
      ),
    );
  }
}

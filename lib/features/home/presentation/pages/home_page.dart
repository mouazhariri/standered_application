import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:standered_application/src/core/utils/constants/messages/app_messages.dart';
import 'package:standered_application/src/resourses/color_manager/color_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    ColorProvider colorProvider = ColorProvider();
    return Scaffold(
      backgroundColor: colorProvider.background,
      appBar: AppBar(
        title: Text(
          "Welcome to my Home page",
        ),
      ),
      body: Column(
        children: [
          Container(
            width: 100.w,
            height: 100.h,
            color: colorProvider.darker,
          )
        ],
      ),
    );
  }
}

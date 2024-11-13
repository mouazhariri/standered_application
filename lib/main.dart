import 'package:flutter/material.dart';
import 'package:standered_application/features/app/my_app.dart';
import 'package:standered_application/src/application/di/app_initilaizer.dart';

void main() async {
  await AppInitilaizer.init();
  runApp(const MyApp());
}

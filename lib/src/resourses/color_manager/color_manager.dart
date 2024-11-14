import 'package:flutter/material.dart';

abstract class ColorsManager {
  Color get primary;
  Color get white;
  Color get black;
  Color get lightPrimary;
  Color get onLightesPrimary;

  Color get scrim;
  Color get darkest;
  Color get darker;
  Color get dark;
  Color get onPrimary;
  Color get green;
  Color get lightGreen;
  Color get red;
  Color get lightesPrimary;
  Color get background;
  Color get surface;
  Color get lightGrey;
  Color get grey;
  Color get greyStroke;
  Color get shadow;
}

class LightColorsManager extends ColorsManager {
  @override
  Color get primary => const Color(0xFFE77316);
  @override
  Color get white => const Color(0xFFFFFFFF);

  @override
  Color get black => const Color(0xFF000000);

  @override
  Color get dark => const Color(0xFF555555);

  @override
  Color get darker => const Color(0xFF333333);

  @override
  Color get darkest => const Color(0xFF222222);

  @override
  Color get lightPrimary => const Color(0xFFEF9D5A);

  @override
  Color get lightesPrimary => const Color(0xFFFFEDE9);

  @override
  Color get onLightesPrimary => const Color.fromARGB(255, 239, 186, 143);

  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  @override
  Color get red => const Color(0xFFF91717);

  @override
  Color get scrim => const Color(0xFF111111);

  @override
  Color get grey => const Color(0xFF828282);

  @override
  Color get green => const Color(0xFF0db91b);

  @override
  Color get lightGreen => const Color(0xFF40F43D);
  @override
  Color get greyStroke => const Color(0xFFE0E0E0);

  @override
  Color get background => const Color(0xFFfafafc);

  @override
  Color get surface => const Color(0xFFFFFFFF);

  @override
  Color get lightGrey => const Color(0XFFC0C0C0);

  @override
  Color get shadow => const Color(0xFF555555);
}

class DarkColorsManager extends ColorsManager {
  @override
  Color get primary => const Color(0xFFE77316);
  @override
  Color get white => const Color(0xFFFFFFFF);

  @override
  Color get black => const Color(0xFF000000);

  @override
  Color get dark => const Color(0xFFCDCDCD);

  @override
  Color get darker => const Color(0xFFE1E1E1);

  @override
  Color get darkest => const Color(0xFFECECEC);

  @override
  Color get lightPrimary => const Color(0xFFEF9D5A);
  @override
  Color get onLightesPrimary => const Color.fromARGB(255, 239, 186, 143);

  @override
  Color get lightesPrimary => const Color(0xFFef9d5a);

  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  @override
  Color get red => const Color(0xFFd22e2e);

  @override
  Color get scrim => const Color(0xFFFFFFFF);
  @override
  Color get grey => const Color(0xFF828282);

  @override
  Color get green => const Color(0xFF0db91b);

  @override
  Color get lightGreen => const Color(0xFF40F43D);
  @override
  Color get greyStroke => const Color(0xFFE0E0E0);
  Color get textFieldFill => const Color.fromARGB(255, 51, 51, 51);

  @override
  Color get background => const Color(0xFF3F3F3F);

  @override
  Color get lightGrey => const Color(0XFFC0C0C0);

  @override
  Color get surface => const Color(0XFF363636);

  @override
  Color get shadow => const Color.fromARGB(255, 0, 0, 0);
}

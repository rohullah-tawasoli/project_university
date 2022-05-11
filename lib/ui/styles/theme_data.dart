import 'package:flutter/material.dart';

class CustomColors {
  static Color primaryTextColor = Colors.white;
  static Color dividerColor = Colors.white54;
  static Color pageBackgroundColor = const Color(0xFF2D2F41);
  static Color menuBackgroundColor = const Color(0xFF242634);

  static Color clockBG = const Color(0xFF444974);
  static Color clockOutline = const Color(0xFFEAECFF);
  static Color secHandColor = Colors.orange[300];
  static Color minHandStatColor = const Color(0xFF748EF6);
  static Color minHandEndColor = const Color(0xFF77DDFF);
  static Color hourHandStatColor = const Color(0xFFC279FB);
  static Color hourHandEndColor = const Color(0xFFEA74AB);
}

class GradientColors {
  final List<Color> colors;
  GradientColors(this.colors);

  static List<Color> sky = [
    const Color(0xFF5FC6FF),
    const Color(0xFF6448FE),
  ];
  static List<Color> sunset = [
    const Color(0xFFFFB463),
    const Color(0xFFFE6197),
  ];
  static List<Color> sea = [
    const Color(0xFF63FFD5),
    const Color(0xFF61A3FE),
  ];
  static List<Color> mango = [
    const Color(0xFFFFE130),
    const Color(0xFFFFA738),
  ];
  static List<Color> fire = [
    const Color(0xFFFF8484),
    const Color(0xFFFF5DCD),
  ];
  static List<Color> hope = [
    const Color(0xFF68C7EC),
    const Color(0xFF008CC8),
  ];
}

class GradientTemplate {
  static List<GradientColors> gradientTemplate = [
    GradientColors(GradientColors.sky),
    GradientColors(GradientColors.sunset),
    GradientColors(GradientColors.sea),
    GradientColors(GradientColors.mango),
    GradientColors(GradientColors.fire),
  ];
}

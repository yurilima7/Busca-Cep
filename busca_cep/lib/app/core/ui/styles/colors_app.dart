import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xFFFFE000);
  Color get secundary => const Color(0xFF66663D);
  Color get secundaryDark => const Color(0xFF333329);
  Color get dark => const Color(0xFF2D2D2D);
  Color get gray => const Color(0xFFA3A3A3);

  Color get success => const Color(0xFFA7FA7A);
  Color get warning => const Color(0xFFFADC6E);
  Color get error => const Color(0xFFFA6E6E);

  Color get light => const Color(0xFFF4F4F4);
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}

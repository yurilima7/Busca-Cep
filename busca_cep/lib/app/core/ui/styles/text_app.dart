import 'package:busca_cep/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class TextApp {
  static TextApp? _instance;

  TextApp._();

  static TextApp get i {
    _instance ??= TextApp._();
    return _instance!;
  }

  String get fontPrimary => 'Montserrat';

  TextStyle get montserratRegular => TextStyle(
        fontFamily: fontPrimary,
        fontWeight: FontWeight.w400,
      );

  TextStyle get montserratMedium => TextStyle(
        fontFamily: fontPrimary,
        fontWeight: FontWeight.w500,
      );

  TextStyle get mainRegular => montserratRegular.copyWith(
        fontSize: 16,
        color: ColorsApp.i.dark,
      );

  TextStyle get titleButton => montserratRegular.copyWith(
        fontSize: 16,
        color: ColorsApp.i.secundaryDark,
      );

  TextStyle get subtitle => montserratRegular.copyWith(
        fontSize: 14,
        color: ColorsApp.i.dark,
      );

  TextStyle get input => montserratRegular.copyWith(
        fontSize: 16,
        color: ColorsApp.i.gray,
      );

  TextStyle get title => montserratMedium.copyWith(
        fontSize: 18,
        color: ColorsApp.i.dark,
      );

  TextStyle get titleCard => montserratMedium.copyWith(
        fontSize: 16,
        color: ColorsApp.i.secundaryDark,
      );
}

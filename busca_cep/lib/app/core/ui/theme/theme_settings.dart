import 'package:busca_cep/app/core/ui/styles/colors_app.dart';
import 'package:busca_cep/app/core/ui/styles/text_app.dart';
import 'package:flutter/material.dart';

class ThemeSettings {
  static ThemeSettings? _instance;

  ThemeSettings._();

  static ThemeSettings get i {
    _instance ??= ThemeSettings._();
    return _instance!;
  }

  ThemeData get themeSettings => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.i.primary,
      primary: ColorsApp.i.primary,
      secondary: ColorsApp.i.secundary,
      error: ColorsApp.i.error,
    ),
    
    appBarTheme: AppBarTheme(
      color: ColorsApp.i.primary,
      titleTextStyle: TextApp.i.mainRegular,
      elevation: 0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorsApp.i.dark,
        backgroundColor: ColorsApp.i.primary,
        textStyle: TextApp.i.titleButton,
        minimumSize: const Size(double.infinity, 46),
      ),
    ),

    cardTheme: CardTheme(
      color: ColorsApp.i.primary,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),

    listTileTheme: ListTileThemeData(
      titleTextStyle: TextApp.i.titleCard,
      subtitleTextStyle: TextApp.i.subtitle,
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextApp.i.input,

      errorStyle: TextApp.i.mainRegular.copyWith(
        color: ColorsApp.i.error,
        fontSize: 12,
      ),

      floatingLabelStyle: TextApp.i.input.copyWith(color: ColorsApp.i.dark),
      fillColor: ColorsApp.i.light,
      filled: true,
      isDense: true,

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: ColorsApp.i.secundary,
          width: 2,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: ColorsApp.i.error,
          width: 2,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: ColorsApp.i.error,
          width: 2,
        ),
      ),
    ),
  );
}

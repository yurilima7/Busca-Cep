import 'package:busca_cep/app/core/ui/theme/theme_settings.dart';
import 'package:busca_cep/app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeSettings.i.themeSettings,
      home: const SplashScreen(),
    );
  }
}
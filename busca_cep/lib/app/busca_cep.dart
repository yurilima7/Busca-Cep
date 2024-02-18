import 'package:busca_cep/app/core/multi_provider/multi_provider_app.dart';
import 'package:busca_cep/app/core/ui/theme/theme_settings.dart';
import 'package:busca_cep/app/screens/splash/splash_screen_router.dart';
import 'package:flutter/material.dart';

class BuscaCep extends StatelessWidget {
  const BuscaCep({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProviderApp(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeSettings.i.themeSettings,
        home: SplashScreenRouter.screen,
      ),
    );
  }
}
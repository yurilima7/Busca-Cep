import 'package:busca_cep/app/screens/home/home_screen.dart';
import 'package:busca_cep/app/screens/home/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenRouter {
  HomeScreenRouter._();

  static Widget get screen => MultiProvider(
    providers: [
      Provider(
        create: (context) => HomeScreenController(
          context.read(),
        ),
      ),
    ],

    builder: (context, child) {
      final args = ModalRoute.of(context)!.settings.arguments 
                as Map<String, dynamic>;

      return HomeScreen(
        isCepSearch: args['isCepSearch'] as bool,
      );
    }, 
  );
}
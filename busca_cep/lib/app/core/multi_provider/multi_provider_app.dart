import 'package:busca_cep/app/core/rest_client/custom_dio.dart';
import 'package:busca_cep/app/repositories/viacep_repository.dart';
import 'package:busca_cep/app/repositories/viacep_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiProviderApp extends StatelessWidget {
  final Widget child;

  const MultiProviderApp({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CustomDio(),),

        Provider<ViacepRepository>(
          create: (context) => ViacepRepositoryImpl(dio: context.read())
        ),
      ],

      child: child,
    );
  }
}

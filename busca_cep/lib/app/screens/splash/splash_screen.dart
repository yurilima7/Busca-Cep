import 'package:busca_cep/app/core/ui/widgets/button_app.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),

          child: LayoutBuilder(
            builder: (_, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const Spacer(),

                      Image.asset(
                        'assets/images/app_logo.png',
                        width: 255,
                        height: 53,
                      ),

                      const Spacer(),
                          
                      ButtonApp(
                        title: 'Pesquisa por Endereço',
                        onPressed: () => {},
                      ),
                          
                      const SizedBox(
                         height: 20,
                      ),
                  
                      ButtonApp(
                        title: 'Busca por CEP',
                        onPressed: () => {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}

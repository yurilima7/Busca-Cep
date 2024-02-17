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
                      SizedBox(
                         height: constraints.maxHeight * 0.4,
                      ),

                      Image.asset(
                        'assets/images/app_logo.png',
                        width: 255,
                        height: 53,
                      ),

                      const Spacer(),
                          
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Pesquisa por Endereço'),
                      ),
                          
                      const SizedBox(
                         height: 20,
                      ),
                  
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Busca por CEP'),
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

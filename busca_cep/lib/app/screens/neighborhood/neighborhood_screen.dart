import 'package:busca_cep/app/core/ui/styles/colors_app.dart';
import 'package:busca_cep/app/core/ui/styles/text_app.dart';
import 'package:busca_cep/app/core/ui/widgets/button_app.dart';
import 'package:busca_cep/app/core/ui/widgets/full_result_card.dart';
import 'package:busca_cep/app/models/address_model.dart';
import 'package:flutter/material.dart';

class NeighborhoodScreen extends StatelessWidget {
  const NeighborhoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final address = args['address'] as AddressModel;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        
        title: Text(
          'Bairro',
          style: context.textApp.mainRegular,
        ),

        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),

        iconTheme: IconThemeData(
          color: context.colors.secundary,
        ),
      ),
      
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      
        child: LayoutBuilder(
          builder: (_, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
            
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const Spacer(),
                    
                    Center(
                      child: Image.asset(
                        'assets/images/street_img.png',
                        width: 255, 
                        height: 234.72,
                      ),
                    ),
                    
                    const Spacer(),
                    const SizedBox(height: 20),
      
                    FullResultCard(addressModel: address),

                    const SizedBox(height: 20),
                    const Spacer(),

                    ButtonApp(
                      title: 'Realizar nova busca',
                      onPressed: () => Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (route) => false),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

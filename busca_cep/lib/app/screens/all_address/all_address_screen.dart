import 'package:busca_cep/app/core/ui/styles/colors_app.dart';
import 'package:busca_cep/app/core/ui/styles/text_app.dart';
import 'package:busca_cep/app/models/address_model.dart';
import 'package:flutter/material.dart';

class AllAddressScreen extends StatelessWidget {
  const AllAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final allAddress = args['allAddress'] as List<AddressModel>;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        
        title: Text(
          'Resultados da Busca',
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
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
      
        child: allAddress.isNotEmpty ? ListView.builder(
          itemCount: allAddress.length,
          
          itemBuilder: (_, index) => InkWell(
            onTap: () => Navigator.of(context).pushNamed(
              '/neighborhood_screen',
              arguments: {'address': allAddress[index]},
            ),

            borderRadius: BorderRadius.circular(10),
            
            child: Card(
              child: ListTile(
                title: Text(
                  '${allAddress[index].street} - ${allAddress[index].neighborhood}',
                  style: context.textApp.titleCard,
                ),

                subtitle: Visibility(
                  visible: allAddress[index].complement != '',

                  replacement: Text(
                    'Sem complemento',
                    style: context.textApp.subtitle,
                  ),

                  child: Text(
                    allAddress[index].complement,
                    style: context.textApp.subtitle,
                  ),
                ),

                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: context.colors.secundary,
                ),
              ),
            ),
          ),
        ) : Center(
          child: Text(
            'Nenhum endereço foi encontrado, tente novamente.',
            style: context.textApp.title,
          ),
        ),
      ),
    );
  }
}

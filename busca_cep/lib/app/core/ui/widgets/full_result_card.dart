import 'package:busca_cep/app/core/ui/styles/colors_app.dart';
import 'package:busca_cep/app/core/ui/styles/text_app.dart';
import 'package:busca_cep/app/models/address_model.dart';
import 'package:flutter/material.dart';

class FullResultCard extends StatelessWidget {
  final AddressModel? addressModel;

  const FullResultCard({super.key, this.addressModel});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: addressModel?.neighborhood != '',

      replacement: Text(
        'Retornou vazio, tente novamente.',
        style: context.textApp.title,
      ),
      
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
      
        child: Card(
          color: context.colors.light,
      
          shape: RoundedRectangleBorder(
            side: BorderSide(color: context.colors.primary, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
      
          child: Padding(
            padding: const EdgeInsets.all(16),
      
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
      
              children: [
                Text("Bairro: ${addressModel?.neighborhood ?? ''}",),
                const SizedBox(height: 2),
                Text("Rua: ${addressModel?.street ?? ''}"),
                const SizedBox(height: 2),
                Text("Cep: ${addressModel?.cep ?? ''}"),
                const SizedBox(height: 2),
                Text("Cidade: ${addressModel?.city ?? ''}"),
                const SizedBox(height: 2),
                Text("Complemento: ${addressModel?.complement ?? ''}"),
                const SizedBox(height: 2),
                Text("UF: ${addressModel?.uf ?? ''}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

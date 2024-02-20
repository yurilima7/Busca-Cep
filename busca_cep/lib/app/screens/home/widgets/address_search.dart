import 'package:busca_cep/app/core/ui/styles/text_app.dart';
import 'package:busca_cep/app/core/ui/widgets/button_app.dart';
import 'package:busca_cep/app/core/ui/widgets/input.dart';
import 'package:busca_cep/app/screens/home/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class AddressSearch extends StatefulWidget {
  final HomeScreenController homeScreenController;

  const AddressSearch({super.key, required this.homeScreenController});

  @override
  State<AddressSearch> createState() => _AddressSearchState();
}

class _AddressSearchState extends State<AddressSearch> {
  final _formKey = GlobalKey<FormState>();
  final _ufEC = TextEditingController();
  final _cityEC = TextEditingController();
  final _streetEC = TextEditingController();
  final _ufFocus = FocusNode();
  final _cityFocus = FocusNode();
  final _streetFocus = FocusNode();

  @override
  void dispose() {
    _ufEC.dispose();
    _cityEC.dispose();
    _streetEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                'Informe seus dados',
                style: context.textApp.title,
              ),

              const SizedBox(height: 20),

              Input(
                label: 'Digite sua UF (Estado)',
                hintText: 'Ex: MA',
                inputType: TextInputType.name,
                action: TextInputAction.next,
                controller: _ufEC,
                focus: _ufFocus,
                hasSearchButton: false,
                validator: Validatorless.multiple([
                  Validatorless.min(2, 'São necessários 2 digitos!'),
                  Validatorless.max(2, 'São aceitos 2 digitos no máximo!'),
                  Validatorless.required('Estado é obrigatório'),
                ]),
              ),

              const SizedBox(height: 10),

              Input(
                label: 'Digite sua cidade',
                hintText: 'Ex: Caxias',
                inputType: TextInputType.name,
                action: TextInputAction.next,
                controller: _cityEC,
                focus: _cityFocus,
                hasSearchButton: false,
                validator: Validatorless.multiple([
                  Validatorless.min(3, 'São necessários 3 digitos!'),
                  Validatorless.required('Cidade é obrigatória'),
                ]),
              ),

              const SizedBox(height: 10),

              Input(
                label: 'Digite sua rua',
                hintText: 'Ex: Rua 20',
                inputType: TextInputType.name,
                action: TextInputAction.done,
                controller: _streetEC,
                focus: _streetFocus,
                hasSearchButton: false,
                validator: Validatorless.multiple([
                  Validatorless.min(3, 'São necessários 3 digitos!'),
                  Validatorless.required('Rua é obrigatória'),
                ]),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        ButtonApp(
          onPressed: () {
            final valid = _formKey.currentState?.validate() ?? false;

            if (valid) {
              widget.homeScreenController.findAllAddress(
                _ufEC.text,
                _cityEC.text,
                _streetEC.text,
              );

              _ufEC.clear();
              _cityEC.clear();
              _streetEC.clear();
            }
          },
          
          title: 'Buscar',
        ),
      ],
    );
  }
}

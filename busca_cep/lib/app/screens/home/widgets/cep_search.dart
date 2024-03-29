import 'package:busca_cep/app/core/ui/widgets/input.dart';
import 'package:busca_cep/app/screens/home/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class CepSearch extends StatefulWidget {
  final HomeScreenController homeScreenController;

  const CepSearch({super.key, required this.homeScreenController});

  @override
  State<CepSearch> createState() => _CepSearchState();
}

class _CepSearchState extends State<CepSearch> {
  final _formKey = GlobalKey<FormState>();
  final _cepEC = TextEditingController();
  final _cepFocus = FocusNode();

  @override
  void dispose() {
    _cepEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
    
      child: Input(
        label: 'Digite seu cep',
        hintText: 'Ex: 01010101',
        inputType: TextInputType.number,
        action: TextInputAction.done,
        controller: _cepEC,
        focus: _cepFocus,
        hasSearchButton: true,
    
        validator: Validatorless.multiple([
          Validatorless.min(8, 'São necessários 8 digitos!'),
          Validatorless.required('Número do cep é obrigatório'),
        ]),
    
        onPressed: () {
          final valid = _formKey.currentState?.validate() ?? false;
    
          if (valid) {
            widget.homeScreenController.findAddrees(_cepEC.text);
            _cepEC.clear();
          }
        },
      ),
    );
  }
}

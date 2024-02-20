import 'package:busca_cep/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Function(String?)? onSaved;
  final TextInputType inputType;
  final FocusNode? focus;
  final TextInputAction action;
  final VoidCallback? onPressed;
  final bool hasSearchButton;

  const Input({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.validator,
    this.onSaved,
    required this.inputType,
    this.focus,
    required this.action,
    this.onPressed, 
    required this.hasSearchButton, 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      keyboardType: inputType,
      focusNode: focus,
      textInputAction: action,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        suffixIconColor: context.colors.dark,
        suffixIcon: hasSearchButton ? IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.search,
            size: 32,
          ),
        ) : null,
      ),
    );
  }
}

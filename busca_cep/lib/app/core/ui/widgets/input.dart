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
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
      ),
    );
  }
}

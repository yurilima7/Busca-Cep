import 'package:busca_cep/app/core/ui/styles/colors_app.dart';
import 'package:busca_cep/app/core/ui/styles/text_app.dart';
import 'package:flutter/material.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  void showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              message,
              style: context.textApp.title,
            ),
            backgroundColor: context.colors.success,
          ),
        );
  }

  
  void showAlert(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              message,
              style: context.textApp.title,
            ),
            backgroundColor: context.colors.warning,
          ),
        );
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              message,
              style: context.textApp.title,
            ),
            backgroundColor: context.colors.error,
          ),
        );
  }
}
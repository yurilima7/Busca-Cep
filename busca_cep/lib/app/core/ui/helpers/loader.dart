import 'package:busca_cep/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  var isOpen = false;

  void showLoader() {
    if (!isOpen) {
      isOpen = true;

      showDialog(
        context: context,
        builder: (context) => LoadingAnimationWidget.threeArchedCircle(
          color: ColorsApp.i.primary,
          size: 60,
        ),
      );
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
    }
    Navigator.of(context).pop();
  }
}
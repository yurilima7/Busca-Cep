import 'package:busca_cep/app/core/ui/helpers/loader.dart';
import 'package:busca_cep/app/core/ui/helpers/messages.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class StateController<T extends StatefulWidget, C >
   extends State<T> with Messages, Loader {
  late final C controller;

  void onReady() {}

  @override
  void initState() {
    super.initState();
    controller = context.read<C>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onReady();
    });
  }
}
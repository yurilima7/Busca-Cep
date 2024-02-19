import 'dart:developer';

import 'package:busca_cep/app/core/exception/repository_exception.dart';
import 'package:busca_cep/app/models/address_model.dart';
import 'package:busca_cep/app/repositories/viacep_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_screen_controller.g.dart';

class HomeScreenController = HomeScreenControllerBase
    with _$HomeScreenController;

abstract class HomeScreenControllerBase with Store {
  final ViacepRepository _viacepRepository;

  HomeScreenControllerBase(this._viacepRepository);

  @observable
  AddressModel? address;
  @observable
  List<AddressModel> allAddress = [];

  @observable
  String msg = '';

  @observable
  String? error;
  @observable
  String? success;

  @observable
  bool? isLoading;

  @computed
  bool get hasError => error != null;
  @computed
  bool get hasSuccess => success != null;

  @action
  Future<void> findAddrees(String cep) async {
    try {
      isLoading = true;

      address = await _viacepRepository.findAddress(cep);
      success = 'Endereço encontrado com sucesso!';
    } on RepositoryException catch (e) {
      log(e.message);
      error = e.message;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> findAllAddress(String uf, String city, String street) async {
    try {
      isLoading = true;

      allAddress = await _viacepRepository.findAllAddress(uf, city, street);
      success = 'Endereços encontrados com sucesso!';
    } on RepositoryException catch (e) {
      log(e.message);
      error = e.message;
    } finally {
      isLoading = false;
    }
  }

  @action
  void loadMsg() {
    final currentTime = DateTime.now().hour;

    msg = currentTime > 5 && currentTime < 12
        ? 'Olá, bom dia!'
        : currentTime >= 12 && currentTime < 18
            ? 'Olá, boa tarde!'
            : 'Olá, boa noite!';
  }
}

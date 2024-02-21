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
  String? alert;

  @observable
  bool loading = false;

  @computed
  bool get hasError => error != null;
  @computed
  bool get hasSuccess => success != null;
  @computed
  bool get hasAlert => alert != null;
  @computed
  bool get isLoading => loading;

  @action
  Future<void> findAddrees(String cep) async {
    try {
      loading = true;
      error = null;
      success = null;
      alert = null;

      address = await _viacepRepository.findAddress(cep);

      if (address?.neighborhood == '') {
        alert = 'A consulta retornou vazia, tente novamente.';
      } else {
        success = 'Endereço encontrado com sucesso!';
      }

    } on RepositoryException catch (e) {
      log(e.message);
      error = e.message;
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> findAllAddress(String uf, String city, String street) async {
    try {
      loading = true;
      error = null;
      success = null;
      alert = null;

      final returnedAddresses = await _viacepRepository.findAllAddress(uf, city, street);

      if (returnedAddresses.isEmpty || returnedAddresses[0].street == '') {  
        alert = 'A consulta retornou vazia, tente novamente.';
      } else {
        allAddress = returnedAddresses;
        success = 'Endereços encontrados com sucesso!';
      }

    } on RepositoryException catch (e) {
      log(e.message);
      error = e.message;
    } finally {
      loading = false;
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

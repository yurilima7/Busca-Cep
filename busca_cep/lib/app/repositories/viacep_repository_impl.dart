import 'dart:developer';

import 'package:busca_cep/app/core/exception/repository_exception.dart';
import 'package:busca_cep/app/core/rest_client/custom_dio.dart';
import 'package:busca_cep/app/models/address_model.dart';
import 'package:busca_cep/app/repositories/viacep_repository.dart';
import 'package:dio/dio.dart';

class ViacepRepositoryImpl implements ViacepRepository {
  final CustomDio dio;

  ViacepRepositoryImpl({
    required this.dio,
  });

  @override
  Future<AddressModel> findAddress(String cep) async {
    try {
      final result = await dio.get('$cep/json');

      return AddressModel.fromMap(result.data);
    } on DioException catch (e, s) {
      log('Erro ao buscar o endereço do cep!', error: e, stackTrace: s);

      throw RepositoryException(message: 'Erro ao buscar o endereço do cep!');
    }
  }

  @override
  Future<List<AddressModel>> findAllAddress(
    String uf,
    String city,
    String street,
  ) async {
    try {
      final result = await dio.get('$uf/$city/$street/json');

      return result.data
          .map<AddressModel>((a) => AddressModel.fromMap(a))
          .toList();
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar os endereços para visualizar o cep!',
        error: e,
        stackTrace: s,
      );

      throw RepositoryException(
          message: 'Erro ao buscar os endereços para visualizar o cep!');
    }
  }
}

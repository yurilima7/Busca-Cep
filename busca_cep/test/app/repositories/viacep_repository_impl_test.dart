import 'package:busca_cep/app/core/exception/repository_exception.dart';
import 'package:busca_cep/app/core/rest_client/custom_dio.dart';
import 'package:busca_cep/app/models/address_model.dart';
import 'package:busca_cep/app/repositories/viacep_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ViacepRepositoryImpl viacepRepository;
  late CustomDio customDio;

  const String cep = '65604556';
  const String uf = 'MA';
  const String street = 'Rua 10';
  const String city = 'Caxias';

  setUp(() {
    customDio = CustomDio();
    viacepRepository = ViacepRepositoryImpl(dio: customDio);
  });

  group('API Viacep', () {
    test('Deve retornar um endereço da api', () async {
      final address = await viacepRepository.findAddress(cep);

      expect(address, isA<AddressModel>());
    });

    test('Deve retornar uma lista de endereços da api', () async {
      final listAddress =
          await viacepRepository.findAllAddress(uf, city, street);

      expect(listAddress, isA<List<AddressModel>>());
    });

    test('Deve retornar um erro ao buscar um endereço por cep', () async {
      expectLater(
        () async => await viacepRepository.findAddress(''),
        throwsA(isA<RepositoryException>()),
      );
    });

    test('Deve retornar um erro ao buscar uma lista de endereços', () async {
      expectLater(
        () async => await viacepRepository.findAllAddress(uf, city, ''),
        throwsA(isA<RepositoryException>()),
      );
    });
  });
}

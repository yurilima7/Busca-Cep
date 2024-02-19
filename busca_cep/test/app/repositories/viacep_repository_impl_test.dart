import 'package:busca_cep/app/core/exception/repository_exception.dart';
import 'package:busca_cep/app/models/address_model.dart';
import 'package:busca_cep/app/repositories/viacep_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockViacepRepositoryImpl extends Mock implements ViacepRepositoryImpl {}

void main() {
  late MockViacepRepositoryImpl mockRepositoryImpl;
  late AddressModel mockAddress;
  late List<AddressModel> mockListAddress;

  const String cep = '65604556';
  const String uf = 'MA';
  const String street = 'Rua 10';
  const String city = 'Caxias';

  setUp(() {
    mockRepositoryImpl = MockViacepRepositoryImpl();

    mockAddress = AddressModel(
      cep: '01001000',
      city: 'Caxias',
      complement: '',
      ddd: '99',
      ibge: '',
      neighborhood: '',
      street: 'Rua Teste',
      uf: 'MA',
    );

    mockListAddress = [
      AddressModel(
        cep: '01001000',
        city: 'Caxias',
        complement: '',
        ddd: '99',
        ibge: '',
        neighborhood: '',
        street: 'Rua Teste',
        uf: 'MA',
      ),

      AddressModel(
        cep: '01001000',
        city: 'Caxias',
        complement: '',
        ddd: '99',
        ibge: '',
        neighborhood: '',
        street: 'Rua Teste',
        uf: 'MA',
      ),
    ];
  });

  group('API Viacep', () {
    test('Deve retornar um endereço', () async {
      when(() => mockRepositoryImpl.findAddress(any()))
          .thenAnswer((_) async => mockAddress);

      final address = await mockRepositoryImpl.findAddress(cep);

      expect(address, isA<AddressModel>());
    });

    test('Deve retornar uma lista de endereços', () async {
      when(() => mockRepositoryImpl.findAllAddress(any(), any(), any()))
          .thenAnswer((_) async => mockListAddress);

      final listAddress =
          await mockRepositoryImpl.findAllAddress(uf, city, street);

      expect(listAddress, isA<List<AddressModel>>());
    });

    test('Deve retornar um erro ao buscar um endereço por cep', () async {
      when(() => mockRepositoryImpl.findAddress(any())).thenThrow(
          RepositoryException(message: 'Erro ao buscar o endereço do cep!'));
          
      expectLater(
        () async => await mockRepositoryImpl.findAddress(''),
        throwsA(isA<RepositoryException>()),
      );
    });

    test('Deve retornar um erro ao buscar uma lista de endereços', () async {
      when(() => mockRepositoryImpl.findAllAddress(any(), any(), any())).thenThrow(
          RepositoryException(
              message: 'Erro ao buscar os endereços para visualizar o cep!'));

      expectLater(
        () async => await mockRepositoryImpl.findAllAddress(uf, city, ''),
        throwsA(isA<RepositoryException>()),
      );
    });
  });
}

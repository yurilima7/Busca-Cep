import 'package:busca_cep/app/core/exception/repository_exception.dart';
import 'package:busca_cep/app/models/address_model.dart';
import 'package:busca_cep/app/repositories/viacep_repository.dart';
import 'package:busca_cep/app/screens/home/home_screen_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockViacepRepository extends Mock implements ViacepRepository {}

void main() {
  late HomeScreenController homeScreenController;
  late MockViacepRepository mockRepository;
  late AddressModel mockAddress;
  late List<AddressModel> mockListAddress;

  const String cep = '01001000';
  const String uf = 'MA';
  const String street = 'Rua Teste';
  const String city = 'Caxias';

  setUp(() {
    mockRepository = MockViacepRepository();
    homeScreenController = HomeScreenController(mockRepository);

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

  group('Testando sucessos na controller', () {
    test('Deve buscar o endereço por CEP com sucesso', () async {
      when(() => mockRepository.findAddress(any()))
          .thenAnswer((_) async => mockAddress);

      await homeScreenController.findAddrees(cep);

      expect(homeScreenController.address, mockAddress);
      expect(homeScreenController.success, 'Endereço encontrado com sucesso!');
      expect(homeScreenController.error, isNull);
      expect(homeScreenController.isLoading, isFalse);
    });

    test('Deve buscar uma lista de endereços por UF, cidade e rua com sucesso',
        () async {
      when(() => mockRepository.findAllAddress(any(), any(), any()))
          .thenAnswer((_) async => mockListAddress);

      await homeScreenController.findAllAddress(uf, city, street);

      expect(homeScreenController.allAddress, mockListAddress);
      expect(
          homeScreenController.success, 'Endereços encontrados com sucesso!');
      expect(homeScreenController.error, isNull);
      expect(homeScreenController.isLoading, isFalse);
    });
  });

  group('Testando erros na controller', () {
    test('Deve retornar erro ao buscar o endereço por CEP', () async {
      when(() => mockRepository.findAddress(any())).thenThrow(
          RepositoryException(message: 'Erro ao buscar o endereço do cep!'));

      await homeScreenController.findAddrees('cep');

      expect(homeScreenController.hasError, isTrue);
      expect(homeScreenController.error, 'Erro ao buscar o endereço do cep!');
      expect(homeScreenController.success, isNull);
      expect(homeScreenController.isLoading, isFalse);
    });

    test('Deve retornar erro ao buscar uma lista de endereços por UF, cidade e rua',
    () async {
      when(() => mockRepository.findAllAddress(any(), any(), any())).thenThrow(
          RepositoryException(
              message: 'Erro ao buscar os endereços para visualizar o cep!'));

      await homeScreenController.findAllAddress(uf, city, street);

      expect(homeScreenController.hasError, isTrue);
      expect(homeScreenController.error,
          'Erro ao buscar os endereços para visualizar o cep!');
      expect(homeScreenController.success, isNull);
      expect(homeScreenController.isLoading, isFalse);
    });
  });
}

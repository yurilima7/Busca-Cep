import 'package:busca_cep/app/models/address_model.dart';

abstract class ViacepRepository {
  Future<List<AddressModel>> findAllAddress(String uf, String city, String street);
  Future<AddressModel> findAddress(String cep);
}

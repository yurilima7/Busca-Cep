import 'dart:convert';

class AddressModel {
  final String cep;
  final String street;
  final String complement;
  final String neighborhood;
  final String uf;
  final String city;
  final String ibge;
  final String ddd;
  
  AddressModel({
    required this.cep,
    required this.street,
    required this.complement,
    required this.neighborhood,
    required this.uf,
    required this.city,
    required this.ibge,
    required this.ddd,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
      'logradouro': street,
      'complemento': complement,
      'bairro': neighborhood,
      'uf': uf,
      'localidade': city,
      'ibge': ibge,
      'ddd': ddd,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      cep: map['cep'] as String,
      street: map['logradouro'] as String,
      complement: map['complemento'] as String,
      neighborhood: map['bairro'] as String,
      uf: map['uf'] as String,
      city: map['localidade'] as String,
      ibge: map['ibge'] as String,
      ddd: map['ddd'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

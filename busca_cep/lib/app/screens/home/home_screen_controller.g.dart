// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenController on HomeScreenControllerBase, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: 'HomeScreenControllerBase.hasError'))
          .value;
  Computed<bool>? _$hasSuccessComputed;

  @override
  bool get hasSuccess =>
      (_$hasSuccessComputed ??= Computed<bool>(() => super.hasSuccess,
              name: 'HomeScreenControllerBase.hasSuccess'))
          .value;

  late final _$addressAtom =
      Atom(name: 'HomeScreenControllerBase.address', context: context);

  @override
  AddressModel? get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(AddressModel? value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$allAddressAtom =
      Atom(name: 'HomeScreenControllerBase.allAddress', context: context);

  @override
  List<AddressModel> get allAddress {
    _$allAddressAtom.reportRead();
    return super.allAddress;
  }

  @override
  set allAddress(List<AddressModel> value) {
    _$allAddressAtom.reportWrite(value, super.allAddress, () {
      super.allAddress = value;
    });
  }

  late final _$errorAtom =
      Atom(name: 'HomeScreenControllerBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$successAtom =
      Atom(name: 'HomeScreenControllerBase.success', context: context);

  @override
  String? get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(String? value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'HomeScreenControllerBase.isLoading', context: context);

  @override
  bool? get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool? value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$findAddreesAsyncAction =
      AsyncAction('HomeScreenControllerBase.findAddrees', context: context);

  @override
  Future<void> findAddrees(String cep) {
    return _$findAddreesAsyncAction.run(() => super.findAddrees(cep));
  }

  late final _$findAllAddressAsyncAction =
      AsyncAction('HomeScreenControllerBase.findAllAddress', context: context);

  @override
  Future<void> findAllAddress(String uf, String city, String street) {
    return _$findAllAddressAsyncAction
        .run(() => super.findAllAddress(uf, city, street));
  }

  @override
  String toString() {
    return '''
address: ${address},
allAddress: ${allAddress},
error: ${error},
success: ${success},
isLoading: ${isLoading},
hasError: ${hasError},
hasSuccess: ${hasSuccess}
    ''';
  }
}

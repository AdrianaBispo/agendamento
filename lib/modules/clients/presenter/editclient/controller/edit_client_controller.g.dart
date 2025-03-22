// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_client_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClientEditController on _ClientEditStore, Store {
  late final _$nameAtom = Atom(name: '_ClientEditStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$telephoneAtom =
      Atom(name: '_ClientEditStore.telephone', context: context);

  @override
  String get telephone {
    _$telephoneAtom.reportRead();
    return super.telephone;
  }

  @override
  set telephone(String value) {
    _$telephoneAtom.reportWrite(value, super.telephone, () {
      super.telephone = value;
    });
  }

  late final _$updateAsyncAction =
      AsyncAction('_ClientEditStore.update', context: context);

  @override
  Future<void> update(ClientDto client) {
    return _$updateAsyncAction.run(() => super.update(client));
  }

  late final _$_ClientEditStoreActionController =
      ActionController(name: '_ClientEditStore', context: context);

  @override
  void validateNome(String value) {
    final _$actionInfo = _$_ClientEditStoreActionController.startAction(
        name: '_ClientEditStore.validateNome');
    try {
      return super.validateNome(value);
    } finally {
      _$_ClientEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateTelephone(String value) {
    final _$actionInfo = _$_ClientEditStoreActionController.startAction(
        name: '_ClientEditStore.validateTelephone');
    try {
      return super.validateTelephone(value);
    } finally {
      _$_ClientEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateAll() {
    final _$actionInfo = _$_ClientEditStoreActionController.startAction(
        name: '_ClientEditStore.validateAll');
    try {
      return super.validateAll();
    } finally {
      _$_ClientEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
telephone: ${telephone}
    ''';
  }
}

mixin _$FormErrorState on _FormErrorState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorState.hasErrors'))
          .value;

  late final _$nameAtom = Atom(name: '_FormErrorState.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$telephoneAtom =
      Atom(name: '_FormErrorState.telephone', context: context);

  @override
  String? get telephone {
    _$telephoneAtom.reportRead();
    return super.telephone;
  }

  @override
  set telephone(String? value) {
    _$telephoneAtom.reportWrite(value, super.telephone, () {
      super.telephone = value;
    });
  }

  @override
  String toString() {
    return '''
name: ${name},
telephone: ${telephone},
hasErrors: ${hasErrors}
    ''';
  }
}

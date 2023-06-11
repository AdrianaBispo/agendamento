// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clientehome_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClienteHomeController on _ClienteHomeStore, Store {
  late final _$nomeAtom =
      Atom(name: '_ClienteHomeStore.nome', context: context);

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$telefoneAtom =
      Atom(name: '_ClienteHomeStore.telefone', context: context);

  @override
  String get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(String value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  late final _$_ClienteHomeStoreActionController =
      ActionController(name: '_ClienteHomeStore', context: context);

  @override
  void validateNome(String value) {
    final _$actionInfo = _$_ClienteHomeStoreActionController.startAction(
        name: '_ClienteHomeStore.validateNome');
    try {
      return super.validateNome(value);
    } finally {
      _$_ClienteHomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateLasteName(String value) {
    final _$actionInfo = _$_ClienteHomeStoreActionController.startAction(
        name: '_ClienteHomeStore.validateLasteName');
    try {
      return super.validateLasteName(value);
    } finally {
      _$_ClienteHomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateTelephone(String value) {
    final _$actionInfo = _$_ClienteHomeStoreActionController.startAction(
        name: '_ClienteHomeStore.validateTelephone');
    try {
      return super.validateTelephone(value);
    } finally {
      _$_ClienteHomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateAll() {
    final _$actionInfo = _$_ClienteHomeStoreActionController.startAction(
        name: '_ClienteHomeStore.validateAll');
    try {
      return super.validateAll();
    } finally {
      _$_ClienteHomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
telefone: ${telefone}
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

  late final _$lastnameAtom =
      Atom(name: '_FormErrorState.lastname', context: context);

  @override
  String? get lastname {
    _$lastnameAtom.reportRead();
    return super.lastname;
  }

  @override
  set lastname(String? value) {
    _$lastnameAtom.reportWrite(value, super.lastname, () {
      super.lastname = value;
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
lastname: ${lastname},
telephone: ${telephone},
hasErrors: ${hasErrors}
    ''';
  }
}

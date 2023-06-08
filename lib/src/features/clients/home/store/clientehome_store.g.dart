// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clientehome_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on _ClienteHomeStore, Store {
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
  String toString() {
    return '''
nome: ${nome},
telefone: ${telefone}
    ''';
  }
}

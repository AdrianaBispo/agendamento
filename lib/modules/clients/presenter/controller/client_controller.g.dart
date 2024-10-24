// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClientController on _ClientStore, Store {
  late final _$_ClientStoreActionController =
      ActionController(name: '_ClientStore', context: context);

  @override
  Future<List<ClientDto>> getAll() {
    final _$actionInfo =
        _$_ClientStoreActionController.startAction(name: '_ClientStore.getAll');
    try {
      return super.getAll();
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}

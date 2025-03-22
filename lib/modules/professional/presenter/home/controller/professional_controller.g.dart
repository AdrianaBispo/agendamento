// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professional_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfessionalController on _ProfessionalStore, Store {
  late final _$loadingAtom =
      Atom(name: '_ProfessionalStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$repositoriesAtom =
      Atom(name: '_ProfessionalStore.repositories', context: context);

  @override
  List<ProfessionalDto> get repositories {
    _$repositoriesAtom.reportRead();
    return super.repositories;
  }

  @override
  set repositories(List<ProfessionalDto> value) {
    _$repositoriesAtom.reportWrite(value, super.repositories, () {
      super.repositories = value;
    });
  }

  late final _$getAllAsyncAction =
      AsyncAction('_ProfessionalStore.getAll', context: context);

  @override
  Future<List<ProfessionalDto>> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
repositories: ${repositories}
    ''';
  }
}

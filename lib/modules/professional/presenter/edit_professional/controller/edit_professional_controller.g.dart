// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_professional_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditProfessionalController on _EditProfessionalStore, Store {
  late final _$nameAtom =
      Atom(name: '_EditProfessionalStore.name', context: context);

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

  late final _$professionAtom =
      Atom(name: '_EditProfessionalStore.profession', context: context);

  @override
  String get profession {
    _$professionAtom.reportRead();
    return super.profession;
  }

  @override
  set profession(String value) {
    _$professionAtom.reportWrite(value, super.profession, () {
      super.profession = value;
    });
  }

  late final _$updateAsyncAction =
      AsyncAction('_EditProfessionalStore.update', context: context);

  @override
  Future<void> update(ProfessionalDto processional) {
    return _$updateAsyncAction.run(() => super.update(processional));
  }

  late final _$_EditProfessionalStoreActionController =
      ActionController(name: '_EditProfessionalStore', context: context);

  @override
  void validateNome(String value) {
    final _$actionInfo = _$_EditProfessionalStoreActionController.startAction(
        name: '_EditProfessionalStore.validateNome');
    try {
      return super.validateNome(value);
    } finally {
      _$_EditProfessionalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateProfession(String value) {
    final _$actionInfo = _$_EditProfessionalStoreActionController.startAction(
        name: '_EditProfessionalStore.validateProfession');
    try {
      return super.validateProfession(value);
    } finally {
      _$_EditProfessionalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateAll() {
    final _$actionInfo = _$_EditProfessionalStoreActionController.startAction(
        name: '_EditProfessionalStore.validateAll');
    try {
      return super.validateAll();
    } finally {
      _$_EditProfessionalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
profession: ${profession}
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

  late final _$professionAtom =
      Atom(name: '_FormErrorState.profession', context: context);

  @override
  String? get profession {
    _$professionAtom.reportRead();
    return super.profession;
  }

  @override
  set profession(String? value) {
    _$professionAtom.reportWrite(value, super.profession, () {
      super.profession = value;
    });
  }

  @override
  String toString() {
    return '''
name: ${name},
profession: ${profession},
hasErrors: ${hasErrors}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_professional_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewProfessionalController on _NewProfessionalStore, Store {
  late final _$valueAtom =
      Atom(name: '_NewProfessionalStore.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$nameAtom =
      Atom(name: '_NewProfessionalStore.name', context: context);

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
      Atom(name: '_NewProfessionalStore.profession', context: context);

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

  late final _$validateAllAsyncAction =
      AsyncAction('_NewProfessionalStore.validateAll', context: context);

  @override
  Future<void> validateAll() {
    return _$validateAllAsyncAction.run(() => super.validateAll());
  }

  late final _$_NewProfessionalStoreActionController =
      ActionController(name: '_NewProfessionalStore', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_NewProfessionalStoreActionController.startAction(
        name: '_NewProfessionalStore.increment');
    try {
      return super.increment();
    } finally {
      _$_NewProfessionalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateNome(String value) {
    final _$actionInfo = _$_NewProfessionalStoreActionController.startAction(
        name: '_NewProfessionalStore.validateNome');
    try {
      return super.validateNome(value);
    } finally {
      _$_NewProfessionalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateProfession(String value) {
    final _$actionInfo = _$_NewProfessionalStoreActionController.startAction(
        name: '_NewProfessionalStore.validateProfession');
    try {
      return super.validateProfession(value);
    } finally {
      _$_NewProfessionalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
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

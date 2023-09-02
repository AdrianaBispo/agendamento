// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newclient_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewClientController on _NewClientStore, Store {
  late final _$nameAtom = Atom(name: '_NewClientStore.name', context: context);

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

  late final _$lastnameAtom =
      Atom(name: '_NewClientStore.lastname', context: context);

  @override
  String get lastname {
    _$lastnameAtom.reportRead();
    return super.lastname;
  }

  @override
  set lastname(String value) {
    _$lastnameAtom.reportWrite(value, super.lastname, () {
      super.lastname = value;
    });
  }

  late final _$telephoneAtom =
      Atom(name: '_NewClientStore.telephone', context: context);

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

  late final _$dateBirthAtom =
      Atom(name: '_NewClientStore.dateBirth', context: context);

  @override
  String get dateBirth {
    _$dateBirthAtom.reportRead();
    return super.dateBirth;
  }

  @override
  set dateBirth(String value) {
    _$dateBirthAtom.reportWrite(value, super.dateBirth, () {
      super.dateBirth = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_NewClientStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$_NewClientStoreActionController =
      ActionController(name: '_NewClientStore', context: context);

  @override
  void validateNome(String value) {
    final _$actionInfo = _$_NewClientStoreActionController.startAction(
        name: '_NewClientStore.validateNome');
    try {
      return super.validateNome(value);
    } finally {
      _$_NewClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateLasteName(String value) {
    final _$actionInfo = _$_NewClientStoreActionController.startAction(
        name: '_NewClientStore.validateLasteName');
    try {
      return super.validateLasteName(value);
    } finally {
      _$_NewClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateTelephone(String value) {
    final _$actionInfo = _$_NewClientStoreActionController.startAction(
        name: '_NewClientStore.validateTelephone');
    try {
      return super.validateTelephone(value);
    } finally {
      _$_NewClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatedateBirth(String value) {
    final _$actionInfo = _$_NewClientStoreActionController.startAction(
        name: '_NewClientStore.validatedateBirth');
    try {
      return super.validatedateBirth(value);
    } finally {
      _$_NewClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateEmail(String value) {
    final _$actionInfo = _$_NewClientStoreActionController.startAction(
        name: '_NewClientStore.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_NewClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateAll() {
    final _$actionInfo = _$_NewClientStoreActionController.startAction(
        name: '_NewClientStore.validateAll');
    try {
      return super.validateAll();
    } finally {
      _$_NewClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
lastname: ${lastname},
telephone: ${telephone},
dateBirth: ${dateBirth},
email: ${email}
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

  late final _$dateBirthAtom =
      Atom(name: '_FormErrorState.dateBirth', context: context);

  @override
  String? get dateBirth {
    _$dateBirthAtom.reportRead();
    return super.dateBirth;
  }

  @override
  set dateBirth(String? value) {
    _$dateBirthAtom.reportWrite(value, super.dateBirth, () {
      super.dateBirth = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_FormErrorState.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  @override
  String toString() {
    return '''
name: ${name},
lastname: ${lastname},
telephone: ${telephone},
dateBirth: ${dateBirth},
email: ${email},
hasErrors: ${hasErrors}
    ''';
  }
}

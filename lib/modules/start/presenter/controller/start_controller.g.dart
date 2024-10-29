// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StartController on _StartControllerBase, Store {
  late final _$selectedAtom =
      Atom(name: '_StartControllerBase.selected', context: context);

  @override
  List<bool> get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(List<bool> value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  late final _$_telasAtom =
      Atom(name: '_StartControllerBase._telas', context: context);

  @override
  List<void> get _telas {
    _$_telasAtom.reportRead();
    return super._telas;
  }

  @override
  set _telas(List<void> value) {
    _$_telasAtom.reportWrite(value, super._telas, () {
      super._telas = value;
    });
  }

  late final _$_selectedIndexAtom =
      Atom(name: '_StartControllerBase._selectedIndex', context: context);

  @override
  int get _selectedIndex {
    _$_selectedIndexAtom.reportRead();
    return super._selectedIndex;
  }

  @override
  set _selectedIndex(int value) {
    _$_selectedIndexAtom.reportWrite(value, super._selectedIndex, () {
      super._selectedIndex = value;
    });
  }

  late final _$_StartControllerBaseActionController =
      ActionController(name: '_StartControllerBase', context: context);

  @override
  void onTap(int index) {
    final _$actionInfo = _$_StartControllerBaseActionController.startAction(
        name: '_StartControllerBase.onTap');
    try {
      return super.onTap(index);
    } finally {
      _$_StartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selected: ${selected}
    ''';
  }
}

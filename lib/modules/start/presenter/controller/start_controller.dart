import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'start_controller.g.dart';

class StartController = _StartControllerBase with _$StartController;

abstract class _StartControllerBase with Store implements Disposable {
  final pageViewController = PageController();
  // ignore: unused_field
  late List<ReactionDisposer> _disposers;

  @override
  void dispose() {
    pageViewController.dispose();
    _disposers = [
      reaction((_) => _selectedIndex, onTap),
    ];
  }

  @observable
  ObservableList<bool> selected =
      ObservableList.of([false, false, true, false]);

  @observable
  List<String> _telas = [
    '', //home
    '', //agenda
    '/clients/', //clientes
    '/professionals/', //profissionais
  ];

  @observable
  int _selectedIndex = 2;

  void initialState() {
    _disposers = [];
    selected = ObservableList.of(
      [
        false,
        false,
        true,
        false,
      ],
    );
  }

  @action
  void onTap(int index) {
    selected.setAll(0, [
      false,
      false,
      false,
      false,
    ]);
    selected[index] = true;
    Modular.to.pushNamed(_telas[index]);
  }
}

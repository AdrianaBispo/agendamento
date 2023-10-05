import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'start_controller.g.dart';

class StartController = _StartControllerBase with _$StartController;

abstract class _StartControllerBase with Store implements Disposable {
  final pageViewController = PageController();
  late List<ReactionDisposer> _disposers;

  @override
  void dispose() {
    pageViewController.dispose();
    _disposers = [
      reaction((_) => _selectedIndex, onTap),
    ];
  }

  @observable
  List<bool> selected = [
    false,
    false,
    true,
    false,
  ];

  @observable
  final List<void> _telas = [
    //Modular.to.navigate(''), //home
    //Modular.to.navigate(''), //agenda
    Modular.to.navigate('/clients/'),
    //Modular.to.navigate(''), //profissionais
  ];

  @observable
  int _selectedIndex = 2;

  // void initialState() {
  //   _disposers = [];
  //   selected = [
  //     false,
  //     false,
  //     true,
  //     false,
  //   ];
  // }

  @action
  void onTap(int index) {
    selected.setAll(0, [
      false,
      false,
      false,
      false,
    ]);
    selected[index] = true;
    _telas[index];
  }
}

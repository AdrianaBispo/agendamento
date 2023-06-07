import 'package:mobx/mobx.dart';
part 'clientehome_store.g.dart';

class Controller = ClienteHomeStore with _$Controller;

abstract class ClienteHomeStore with Store{
  @observable
  String nome = '';


}
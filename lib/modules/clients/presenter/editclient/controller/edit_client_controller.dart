import '../../../clients/data/dtos/client_dto.dart';
import '../../data/datasources/local/client_datasource_local_datasource_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'client_controller.g.dart';

class ClientEditController = _ClientEditStore with _$ClientEditController;

abstract class _ClientEditStore with Store {
  final ClientLocalDataSourceImpl clientLocalDataSource =
      Modular.get<ClientLocalDataSourceImpl>();

}

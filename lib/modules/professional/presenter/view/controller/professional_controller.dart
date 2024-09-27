import '../../../professional/data/dtos/professional_dto.dart';
import '../../data/datasources/local/professional_datasource_local_datasource_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'professional_controller.g.dart';

class ProfessionalController = _ProfessionalStore with _$ProfessionalController;

abstract class _ProfessionalStore with Store {
  final ProfessionalLocalDataSourceImpl professionalLocalDataSource =
      Modular.get<ProfissionalLocalDataSourceImpl>();

  @action
  Future<List<ProfessionalDto>> getAll() {
    return professionalLocalDataSource.getAll();
  }
}

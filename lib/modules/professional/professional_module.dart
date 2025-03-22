import 'package:flutter_modular/flutter_modular.dart';

//data
import 'data/datasources/local/professional_datasource_local_datasource_impl.dart';
import 'data/repositories/professional_repository_impl.dart';
//presenter
import 'presenter/home/controller/professional_controller.dart';
import 'presenter/home/view/professional_view.dart';
import 'presenter/edit_professional/controller/edit_professional_controller.dart';
import 'presenter/new_professional/controller/new_professional_controller.dart';

class ProfessionalModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => ProfessionalLocalDataSourceImpl()),
        Bind((i) => ProfessionalRepositoryImpl(i.get<ProfessionalLocalDataSourceImpl>())),
        Bind((i) => ProfessionalController(i.get<ProfessionalRepositoryImpl>())),
        //NewProfessional
        Bind((i) => NewProfessionalController(i.get<ProfessionalRepositoryImpl>())),
        //EditProfessional
        Bind((i) => EditProfessionalController(i.get<ProfessionalRepositoryImpl>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ProfissionaisHome()),
      ];
}

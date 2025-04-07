import 'package:flutter_modular/flutter_modular.dart';

//data
import 'data/datasources/local/professional_datasource_local_datasource_impl.dart';
import 'data/repositories/professional_repository_impl.dart';
//presenter
import 'domain/repositories/professional_repository.dart';
import 'presenter/home/controller/professional_controller.dart';
import 'presenter/home/view/professional_view.dart';
import 'presenter/edit_professional/controller/edit_professional_controller.dart';
import 'presenter/new_professional/controller/new_professional_controller.dart';

class ProfessionalModule extends Module {
  @override
  void binds(i) {
    i.add(ProfessionalLocalDataSourceImpl.new);
    i.addSingleton<ProfessionalRepository>(() =>
        ProfessionalRepositoryImpl(i.get<ProfessionalLocalDataSourceImpl>()));

    i.add(() => ProfessionalController(i.get<ProfessionalRepositoryImpl>()));

    i.add(() => ProfessionalController(i.get<ProfessionalRepositoryImpl>()));
    i.add(() => NewProfessionalController(i.get<ProfessionalRepositoryImpl>()));
    i.add(() => EditProfessionalController(i.get<ProfessionalRepositoryImpl>()));
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const ProfissionaisHome());
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:agenda/modules/clients/data/datasources/client_datasource.dart';
import 'package:agenda/modules/clients/data/datasources/local/client_datasource_local_datasource_impl.dart';
import 'package:agenda/modules/professional/professional_module.dart';
//view
import '../modules/start/presenter/view/start_page.dart';
//controller
import '../modules/start/presenter/controller/start_controller.dart';
//module
import 'package:agenda/modules/clients/clients_module.dart';


class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => StartController()),
        Bind.singleton<ClientDataSource>((i) => ClientLocalDataSourceImpl()),
  
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const StartPage(),
          children: [
            ModuleRoute('/clients', module: ClientsModule()),
            ModuleRoute('/professional', module: ProfessionalModule()),
          ],
        ),
      ];
}

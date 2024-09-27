import 'package:agenda/modules/clients/data/datasources/client_datasource.dart';
import 'package:agenda/modules/clients/data/datasources/local/client_datasource_local_datasource_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
//view
import '../modules/start/presenter/view/start_page.dart';
//controller
import '../modules/start/presenter/controller/start_controller.dart';
//module
import 'package:agenda/src/features/clients/clients_module.dart';
//database
import 'features/clients/cliente_hive/client_adapter.dart';
import 'features/clients/cliente_hive/cliente_hive.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => StartController()),
        Bind.singleton<IClienteAdapter>((i) => ClienteHive()), 
        Bind.singleton<ClientDataSource>((i) => ClientLocalDataSourceImpl()),
  
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const StartPage(),
          children: [
            ModuleRoute('/clients', module: ClientsModule()),
          ],
        ),
      ];
}
import 'package:flutter_modular/flutter_modular.dart';
//view
import 'features/start/view/start_page.dart';
//controller
import 'features/start/controller/start_controller.dart';
//module
import 'features/clients/clients_module.dart';
//database
import 'features/clients/cliente_hive/client_adapter.dart';
import 'features/clients/cliente_hive/cliente_hive.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => StartController()),
        Bind.singleton<IClienteAdapter>((i) => ClienteHive()), 
  
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

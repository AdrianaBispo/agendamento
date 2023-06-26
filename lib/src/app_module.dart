import 'package:flutter_modular/flutter_modular.dart';

import 'features/clients/clients_module.dart';
import 'features/start/controller/start_controller.dart';
import 'features/start/view/start_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => StartController())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const StartPage(), children: [
          ModuleRoute('/clients', module: ClientsModule()),
        ],),
    
  ];
}